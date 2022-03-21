import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../resources/database_and_table_names.dart';

/// Holds information for a single [RelationshipBar].
///
/// A [RelationshipBar] holds an [order] number, [label] text, [prevValue] number, [value] number and [changed] check.
class RelationshipBar {
  RelationshipBar({
    required this.order,
    required this.label,
    this.prevValue = defaultBarValue,
    this.value = defaultBarValue,
    this.changed = false,
    this.firestore,
  });

  final FirebaseFirestore? firestore;

  /// Gives the ordering it should be placed in the set of bars.
  int order;

  /// The text to display with the bar.
  String label;

  /// The previous value that it was set to, from 0 to 100.
  int prevValue;

  /// The current value that it is set to, from 0 to 100.
  int value;

  /// Whether it has been changed since the last save to the database.
  bool changed;

  /// Max is 100.
  static const maxBarValue = 100;

  /// Min is 0.
  static const minBarValue = 0;

  // Initial value, currently set to the max value which is 100. Thought it was more optimistic to default to max than min.
  static const defaultBarValue = maxBarValue;

  // Column names for a RelationshipBar document in the FirebaseFirestore Database.
  static const String _columnOrder = 'order';
  static const String _columnLabel = 'label';
  static const String _columnValue = 'value';
  static const String _columnPrevValue = 'prevValue';

  /// Sets [value] to the given value, and sets [prevValue] and [changed] to true, if [value] has changed.
  int setValue(int newValue) {
    if (newValue != value) {
      prevValue = value;
      value = newValue;
      changed = true;
    }
    return value;
  }

  /// Resets [value] to the [prevValue], and sets [changed] to false.
  int resetValue() {
    value = prevValue;
    changed = false;
    return value;
  }

  /// Returns [label] and [value] with format 'label: value%'.
  @override
  String toString() {
    return labelString() + valueString();
  }

  /// Returns [label] with format 'label: '.
  String labelString() {
    return label + ": ";
  }

  /// Returns [value] with format 'value: %'.
  String valueString() {
    return value.toString() + "%";
  }

  /// Converts a given [Map] to the returned [RelationshipBar].
  static RelationshipBar fromMap(Map<String, Object?> res, FirebaseFirestore firestore) {
    return RelationshipBar(
      order: res[_columnOrder] as int,
      label: res[_columnLabel]! as String,
      value: res[_columnValue] is int ? res[_columnValue] as int : defaultBarValue,
      prevValue: res[_columnValue] is int ? res[_columnValue] as int : defaultBarValue,
      firestore: firestore,
    );
  }

  /// Converts this [RelationshipBar] to the returned [Map].
  Map<String, Object?> toMap() {
    return <String, Object?>{
      _columnOrder: order,
      _columnLabel: label,
      _columnPrevValue: prevValue,
      _columnValue: value,
    };
  }

  /// Calls [toMap] on a list of [RelationshipBar].
  static List<Map<String, Object?>>? toMapList(List<RelationshipBar>? info) {
    return info?.map((e) => e.toMap()).toList();
  }

  /// Calls [fromMap] on a list of [Map].
  static List<RelationshipBar>? fromMapList(List<Map<String, Object?>> maps, FirebaseFirestore firestore) {
    maps.sort((a, b) => (a[_columnOrder] as int).compareTo(b[_columnOrder] as int));
    return maps.map((e) => fromMap(e, firestore)).toList();
  }

  /// Creates a [RelationshipBar] with default values and given label for each String in labels.
  static List<RelationshipBar> listFromLabels(List<String> labels, FirebaseFirestore firestore) {
    return List<RelationshipBar>.generate(
        labels.length, (index) => RelationshipBar(order: index, label: labels[index], firestore: firestore));
  }
}

/// Holds information for a [RelationshipBarDocument] containing a list of [RelationshipBar].
class RelationshipBarDocument {
  RelationshipBarDocument({
    required this.id,
    this.timestamp,
    this.barList,
    required this.firestore,
  });

  final FirebaseFirestore firestore;

  /// id in database for this document.
  final String id;

  /// Timestamp when document was last changed.
  Timestamp? timestamp;

  /// List of [RelationshipBar] in document.
  List<RelationshipBar>? barList;

  /// Column names for a RelationshipBar document in the FirebaseFirestore Database.
  static const String columnID = 'id';
  static const String columnTimestamp = 'timestamp';
  static const String columnBarList = 'barList';

  /// Sets all bars in this [barList] to have [RelationshipBar.changed] set to false.
  RelationshipBarDocument resetBarsChanged() {
    barList?.map((e) {
      e.changed = false;
      return e;
    }).toList();
    return this;
  }

  /// Replaces [barList] with the list of [RelationshipBar] stored in the database.
  Future<RelationshipBarDocument> resetBars(String userID) async {
    barList = (await firestoreGet(userID))!.barList;
    return resetBarsChanged();
  }

  /// Gets a reference to the [RelationshipBarDocument] collection for user with the given id.
  static CollectionReference<RelationshipBarDocument> getUserBarsFromID(String userID, FirebaseFirestore firestore) {
    return firestore
        .collection(userBarsCollection)
        .doc(userID)
        .collection(specificUserBarsCollection)
        .withConverter<RelationshipBarDocument>(
          fromFirestore: (snapshots, _) => RelationshipBarDocument.fromMap(snapshots.data()!, firestore),
          toFirestore: (relationshipBarDocument, _) => relationshipBarDocument.toMap(),
        );
  }

  /// Converts a given [Map] to the returned [RelationshipBarDocument].
  static RelationshipBarDocument fromMap(Map<String, Object?> res, FirebaseFirestore firestore) {
    return RelationshipBarDocument(
      id: res[columnID] as String,
      timestamp: res[columnTimestamp] as Timestamp,
      barList: RelationshipBar.fromMapList(List<Map<String, Object?>>.from(res[columnBarList] as List), firestore),
      firestore: firestore,
    );
  }

  /// Converts this [RelationshipBarDocument] to the returned [Map].
  Map<String, Object?> toMap() {
    return <String, Object?>{
      columnID: id,
      columnTimestamp: timestamp,
      columnBarList: RelationshipBar.toMapList(barList),
    };
  }

  /// Converts a [QuerySnapshot] to a list of [RelationshipBarDocument].
  static List<RelationshipBarDocument> fromQuerySnapshot(QuerySnapshot<RelationshipBarDocument> snapshot) {
    return snapshot.docs.map((e) => e.data()).toList();
  }

  /// Retrieve specific [RelationshipBarDocument] from the FirebaseFirestore collection for given userID.
  Future<RelationshipBarDocument?> firestoreGet(String userID, [GetOptions? options]) async {
    debugPrint("RelationshipBarDocument.firestoreGet: Get doc with barDocID: $id.");
    RelationshipBarDocument? doc = await getUserBarsFromID(userID, firestore)
        .doc(id)
        .get(options)
        .then((snapshot) => snapshot.data())
        .catchError((error) {
      debugPrint("RelationshipBarDocument.firestoreGet: Failed to retrieve relationship bar document: $error.");
    });
    return doc;
  }

  /// Retrieve [RelationshipBarDocument] with the greatest timestamp from the FirebaseFirestore collection for given userID.
  static Future<RelationshipBarDocument?> firestoreGetLatest(String userID, FirebaseFirestore firestore,
      [GetOptions? options]) async {
    debugPrint("RelationshipBarDocument.firestoreGetLatest: Get doc for userID: $userID.");

    return await getUserBarsFromID(userID, firestore)
        .where(columnTimestamp, isNull: false)
        .orderBy(columnTimestamp, descending: true)
        .limit(1)
        .get(options)
        .then((QuerySnapshot<RelationshipBarDocument?> snapshot) => snapshot.docs[0].data())
        .catchError((error) {
      debugPrint("RelationshipBarDocument.firestoreGetLatest: Failed to retrieve relationship bar document: $error.");
    });
  }

  /// Retrieve ordered list of [RelationshipBarDocument] for user with given userID.
  static Query<RelationshipBarDocument> getOrderedUserBarsFromID(String userID, FirebaseFirestore firestore) {
    return getUserBarsFromID(userID, firestore).orderBy(RelationshipBarDocument.columnTimestamp, descending: true);
  }

  /// Retrieve list of [RelationshipBarDocument] from the FirebaseFirestore collection for given userID.
  static Future<List<RelationshipBarDocument>?> firestoreGetAll(String userID, FirebaseFirestore firestore,
      [GetOptions? options]) async {
    debugPrint("RelationshipBarDocument.firestoreGetAll: Get docs for userID: $userID.");
    return await getUserBarsFromID(userID, firestore)
        .get(options)
        .then((snapshot) => fromQuerySnapshot(snapshot))
        .catchError((error) {
      debugPrint("RelationshipBarDocument.firestoreGetAll: Failed to retrieve relationship bar documents: $error.");
      return <RelationshipBarDocument>[];
    });
  }

  /// Creates/updates this [RelationshipBarDocument] in given userID's RelationshipBarDocument FirebaseFirestore collection.
  Future<void> firestoreSet(String userID) async {
    debugPrint("RelationshipBarDocument.firestoreSet: Set doc with id: $id, for userID: $userID.");
    return await getUserBarsFromID(userID, firestore)
        .doc(id)
        .set(this, SetOptions(merge: true))
        .then((value) => debugPrint(
            "RelationshipBarDocument.firestoreSet: Relationship Bar Document Added with id: $id, for userID: $userID."))
        .catchError((error) =>
            debugPrint("RelationshipBarDocument.firestoreSet: Failed to add relationship bar document: $error"));
  }

  /// Creates/merges each [RelationshipBarDocument] in list to given userID's RelationshipBarDocument FirebaseFirestore collection.
  static Future<void> firestoreSetList(
      String userID, List<RelationshipBarDocument> barDocs, FirebaseFirestore firestore) async {
    debugPrint("RelationshipBarDocument.firestoreSetList: Set list of barDocs: $barDocs");
    final CollectionReference<RelationshipBarDocument> ref = getUserBarsFromID(userID, firestore);
    final WriteBatch batch = firestore.batch();

    for (RelationshipBarDocument barDoc in barDocs) {
      batch.set(ref.doc(barDoc.id), barDoc, SetOptions(merge: true));
    }
    await batch.commit();
  }

  /// Updates columns of [RelationshipBarDocument] with given userID and barDocID, using the given data Map, in the RelationshipBarDocument FirebaseFirestore collection.
  Future<void> firestoreUpdateColumns(String userID, Map<String, Object?> data) async {
    debugPrint("RelationshipBarDocument.firestoreUpdateColumns: Update doc with id: $id.");
    await getUserBarsFromID(userID, firestore)
        .doc(id)
        .update(data)
        .then(
            (value) => debugPrint("RelationshipBarDocument.firestoreUpdateColumns: Relationship Bar Document Updated."))
        .catchError((error) => debugPrint(
            "RelationshipBarDocument.firestoreUpdateColumns: Failed to update relationship bar document: $error."));
  }

  /// Deletes this [RelationshipBarDocument] from given userID's RelationshipBarDocument FirebaseFirestore collection.
  Future<void> firestoreDelete(String userID) async {
    debugPrint("RelationshipBarDocument.firestoreDelete: Delete doc with id: $id.");
    await getUserBarsFromID(userID, firestore)
        .doc(id)
        .delete()
        .then((value) => debugPrint("RelationshipBarDocument.firestoreDelete: Relationship Bar Document Deleted."))
        .catchError((error) => debugPrint("firestoreDelete: Failed to delete relationship bar document: $error."));
  }

  /// Creates [RelationshipBarDocument] with given barList and adds to given userID's RelationshipBarDocument FirebaseFirestore collection.
  static Future<RelationshipBarDocument> firestoreAddBarList(
      String userID, List<RelationshipBar> barList, FirebaseFirestore firestore) async {
    debugPrint("RelationshipBarDocument.firestoreAddBarList: Add list: $barList.");
    WriteBatch batch = firestore.batch();
    RelationshipBarDocument barDoc = firestoreAddBarListWithBatch(userID, barList, batch, firestore);
    await batch.commit();
    return barDoc;
  }

  /// Uses given batch without committing to give batch operations that add a bar list.
  ///
  /// Creates [RelationshipBarDocument] with given barList and adds to given userID's RelationshipBarDocument FirebaseFirestore collection.
  /// Doesn't call [WriteBatch.commit], adds necessary operations to batch which should be committed after this function call.
  ///
  /// See also: [firestoreAddBarList] which has the same functionality, without a given batch.
  static RelationshipBarDocument firestoreAddBarListWithBatch(
      String userID, List<RelationshipBar> barList, WriteBatch batch, FirebaseFirestore firestore) {
    // Allows passing in a batch so that adding a bar list can be combined with other operations in one batch commit.
    debugPrint("RelationshipBarDocument.firestoreAddBarListWithBatch: Add list: $barList.");
    final CollectionReference<RelationshipBarDocument> ref = getUserBarsFromID(userID, firestore);
    DocumentReference<RelationshipBarDocument> docRef = ref.doc();
    RelationshipBarDocument barDoc =
        RelationshipBarDocument(id: docRef.id, timestamp: Timestamp.now(), barList: barList, firestore: firestore);
    batch.set(docRef, barDoc, SetOptions(merge: true));
    batch.update(docRef, {columnTimestamp: FieldValue.serverTimestamp()});
    return barDoc;
  }
}
