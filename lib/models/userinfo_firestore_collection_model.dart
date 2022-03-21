import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutterfire_ui/auth.dart';

import '../models/relationship_bar_model.dart';
import '../providers/user_info_state.dart';
import '../resources/authentication.dart';
import '../resources/database_and_table_names.dart';
import '../resources/delete_firestore_collection.dart';
import '../resources/printable_error.dart';
import '../utils/globals.dart';
import 'link_code_firestore_collection_model.dart';

/// Holds information for a [UserInformation].
///
/// A [UserInformation] holds info for a user with the [userID], given their [displayName], [partner], [linkCode], and [linkPending] check.
class UserInformation {
  UserInformation({
    required this.userID,
    this.displayName,
    this.partner,
    required this.linkCode,
    this.linkPending = false,
    required this.firestore,
  }) {
    _userInfoFirestoreRef = _setupFirestoreConverter(firestore);
  }

  /// ID in the database for the user.
  final String userID;

  /// String with display name for user if one has been set.
  String? displayName;

  /// [DocumentReference] to this user's partner if there is one connected.
  DocumentReference? partner;

  /// [DocumentReference] to this user's [LinkCode].
  DocumentReference linkCode;

  /// True if this user currently has a link request pending from another user.
  bool linkPending;

  /// Gets the ID for this user's partner if there is one connected.
  String? get partnerID => partner?.id;

  /// Firestore instance.
  final FirebaseFirestore firestore;

  /// Column names for a UserInformation document in the FirebaseFirestore Database.
  static const String columnUserID = 'id';
  static const String columnDisplayName = 'displayName';
  static const String columnPartner = 'partner';
  static const String columnLinkCode = 'linkCode';
  static const String columnLinkPending = 'linkPending';

  // Reference to the UserInformation collection in FirebaseFirestore database.
  late final CollectionReference<UserInformation?> _userInfoFirestoreRef;

  static CollectionReference<UserInformation?> _setupFirestoreConverter(FirebaseFirestore firestore) =>
      firestore.collection(userInfoCollection).withConverter<UserInformation?>(
            fromFirestore: (snapshots, _) => UserInformation.fromMap(snapshots.data()!, firestore),
            toFirestore: (userInfo, _) => userInfo!.toMap(),
          );

  /// Converts a given [Map] to the returned [UserInformation].
  static UserInformation fromMap(Map<String, Object?> res, FirebaseFirestore firestore) {
    return UserInformation(
      userID: res[columnUserID]! as String,
      displayName: res[columnDisplayName] as String?,
      partner: res[columnPartner] as DocumentReference?,
      linkCode: res[columnLinkCode] as DocumentReference,
      linkPending: res[columnLinkPending] as bool,
      firestore: firestore,
    );
  }

  /// Converts this [UserInformation] to the returned [Map].
  Map<String, Object?> toMap() {
    return <String, Object?>{
      columnUserID: userID,
      columnDisplayName: displayName,
      columnPartner: partner,
      columnLinkCode: linkCode,
      columnLinkPending: linkPending
    };
  }

  /// Calls [toMap] on a list of [UserInformation].
  static List<Map<String, Object?>> userInfoToList(List<UserInformation> info) {
    return info.map((e) => e.toMap()).toList();
  }

  /// Calls [fromMap] on a list of [Map].
  List<UserInformation> userInfoFromList(List<Map<String, Object?>> query) {
    return query.map((e) => fromMap(e, firestore)).toList();
  }

  /// Gets a reference to the [UserInformation] document for user in Firestore.
  DocumentReference<UserInformation?> getUserInDatabase() {
    return _userInfoFirestoreRef.doc(userID);
  }

  /// Gets a reference to the [UserInformation] document for user with given id in Firestore.
  static DocumentReference<UserInformation?> getUserInDatabaseFromID(String userID, FirebaseFirestore firestore) {
    return _setupFirestoreConverter(firestore).doc(userID);
  }

  /// Retrieve [UserInformation] from the FirebaseFirestore collection for given userID.
  static Future<UserInformation?> firestoreGet(String userID, FirebaseFirestore firestore) async {
    debugPrint("UserInformation.firestoreGet: Get doc with userID: $userID.");
    UserInformation? info =
        await getUserInDatabaseFromID(userID, firestore).get().then((snapshot) => snapshot.data()).catchError((error) {
      debugPrint("UserInformation.firestoreGet: Failed to retrieve user info: $error.");
    });
    return info;
  }

  /// Creates/updates this [UserInformation] in database.
  Future<void> firestoreSet() async {
    return await getUserInDatabase()
        .set(this, SetOptions(merge: true))
        .then((value) => debugPrint("UserInformation.firestoreSet: User Info added for userID: $userID."))
        .catchError((error) => debugPrint("UserInformation.firestoreSet: Failed to add user info: $error."));
  }

  /// Updates columns of [UserInformation] for user, using the given data Map, in the database.
  Future<void> firestoreUpdateColumns(Map<String, Object?> data) async {
    return await getUserInDatabase()
        .update(data)
        .then((value) => debugPrint("UserInformation.firestoreUpdateColumns: User Info updated for userID: $userID."))
        .catchError(
            (error) => debugPrint("UserInformation.firestoreUpdateColumns: Failed to update user info: $error."));
  }

  /// Deletes this [UserInformation] from the database.
  Future<void> firestoreDelete() async {
    return await getUserInDatabase()
        .delete()
        .then((value) => debugPrint("UserInformation.firestoreDelete: User Info deleted for userID: $userID."))
        .catchError((error) => debugPrint("UserInformation.firestoreDelete: Failed to delete user info: $error."));
  }

  /// Deletes all data for the current signed in user, as well as their account, from Firebase and the FirebaseFirestore.
  ///
  /// Removes user from partners UserInformation if linked,
  /// deletes user's UserInformation, LinkCode,
  /// and RelationshipBarDocument with all contained RelationshipBars.
  ///
  /// Throws [PrintableError] if there is no userID stored for currentUser,
  /// or the userID for currentUser doesn't match the locally stored UserInformation,
  /// or if an error occurs during deletion.
  Future<void> deleteUserData(BuildContext context) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    String? userID = auth.currentUser?.uid;
    if (userID != null && userID == this.userID) {
      try {
        WriteBatch batch = firestore.batch();
        if (partner != null) {
          batch.update(partner!, {UserInformation.columnPartner: null});
        }
        DocumentReference userDoc = getUserInDatabase();
        batch.delete(userDoc);
        batch.delete(linkCode);
        // Add batch commit promises for all RelationshipBars for user, split in chunks of 500.
        // Max operations in a batch is 500, thus the split. This is necessary since:
        // "When you delete a document, Cloud Firestore does not automatically delete the documents within its subcollections".
        List<Future<void>> batchPromises =
            await deleteCollection(firestore, RelationshipBarDocument.getUserBarsFromID(userID, firestore), 500);

        batch.delete(firestore.collection(userBarsCollection).doc(userID));
        batchPromises.add(batch.commit());

        // Commit all batch commits at once.
        await Future.wait(batchPromises);
        await _deleteAccount(context, auth);
        debugPrint("UserInformation.deleteUserData: Deleted user with id: $userID, ${this.userID}.");
      } catch (error) {
        throw PrintableError(error.toString());
      }
    } else if (userID == null) {
      throw PrintableError("No user signed in.");
    } else {
      throw PrintableError("Information for signed in user is incorrect.");
    }
  }

  // Deletes the account for currently signed in user, from [FirebaseAuth], reauthenticating if required.
  static Future<void> _deleteAccount(BuildContext context, FirebaseAuth auth) async {
    await auth.currentUser?.delete().onError((FirebaseAuthException error, _) async {
      if (error.code == 'requires-recent-login') {
        final signedIn = await _reauthenticate(context, auth);
        if (signedIn) {
          return await auth.currentUser?.delete();
        }
      }
      throw error;
    });
  }

  static Future<bool> _reauthenticate(BuildContext context, FirebaseAuth _auth) {
    return showReauthenticateDialog(
      context: context,
      providerConfigs: providerConfigs,
      auth: _auth,
      onSignedIn: () => Navigator.of(context).pop(true),
    );
  }

  /// Adds new user to database with default info.
  Future<void> setupUserInDatabase(DocumentReference<UserInformation?> userDoc, DocumentReference<LinkCode?> linkCode,
      UserInfoState userInfoState) async {
    WriteBatch batch = firestore.batch();
    batch.set(userDoc, this);
    batch.set(linkCode, LinkCode(linkCode: linkCode.id, user: userDoc));
    // Setup default bars.
    List<RelationshipBar> defaultBars = RelationshipBar.listFromLabels(defaultBarLabels);
    userInfoState.latestRelationshipBarDoc =
        RelationshipBarDocument.firestoreAddBarListWithBatch(userID, defaultBars, batch, firestore);
    await batch.commit().catchError((error) => debugPrint("ApplicationState.userLoggedInSetup: Batch Error: $error"));
  }
}
