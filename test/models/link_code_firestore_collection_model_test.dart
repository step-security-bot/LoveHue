import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lovehue/models/link_code_firestore_collection_model.dart';
import 'package:lovehue/models/userinfo_firestore_collection_model.dart';
import 'package:lovehue/providers/partners_info_state.dart';
import 'package:lovehue/providers/user_info_state.dart';
import 'package:lovehue/resources/database_and_table_names.dart';
import 'package:lovehue/resources/printable_error.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';

import 'link_code_firestore_collection_model_test.mocks.dart';

@GenerateMocks([UserInfoState, PartnersInfoState, DocumentReference, UserInformation])
void main() {
  setUp(() {});
  tearDown(() {});


  group('fromMap', () {
    final MockDocumentReference<UserInformation?> ref = MockDocumentReference<UserInformation?>();

    test('valid LinkCode should map', () {
      LinkCode expected = LinkCode(linkCode: '123', user: ref);
      Map<String, Object?> map = {'linkCode': '123', 'user': ref};
      LinkCode result = LinkCode.fromMap(map);
      expect(result.linkCode, expected.linkCode);
      expect(result.user, expected.user);
    });
  });

  group('toMap', () {
    final MockDocumentReference<UserInformation?> ref = MockDocumentReference<UserInformation?>();
    test('valid LinkCode should map', () {
      Map<String, Object?> expected = {'linkCode': '123', 'user': ref};
      LinkCode code = LinkCode(linkCode: '123', user: ref);
      Map<String, Object?> result = code.toMap();
      expect(result['linkCode'], expected['linkCode']);
      expect(result['user'], expected['user']);
    });
  });

  group('connectTo', () {
    final FakeFirebaseFirestore firestore = FakeFirebaseFirestore();
    final MockPartnersInfoState partnersInfoState = MockPartnersInfoState();
    final MockDocumentReference<UserInformation?> ref = MockDocumentReference<UserInformation?>();
    final LinkCode linkCode = LinkCode(linkCode: '123', user: ref);
    final DocumentReference linkCodeRef = firestore.collection(linkCodesCollection).doc('123');
    final UserInformation partnerInfo = UserInformation(userID: '1234', linkCode: linkCodeRef, firestore: firestore);
    final UserInformation userInfo = UserInformation(userID: '9876', linkCode: MockDocumentReference(), firestore: firestore);

    setUp(() async {
      when(ref.id).thenReturn('1234');
      await linkCodeRef.set(linkCode.toMap());
      await firestore.collection(userInfoCollection).doc(ref.id).set(partnerInfo.toMap());
      await firestore.collection(userInfoCollection).doc(userInfo.userID).set(userInfo.toMap());
      when(partnersInfoState.partnerExist).thenReturn(false);
      when(partnersInfoState.partnerPending).thenReturn(false);
    });

    tearDown(() {});

    test('valid user adds partner to state', () async {
      when(partnersInfoState.addPartner(partnerInfo, userInfo)).thenAnswer((realInvocation) => expect(realInvocation.positionalArguments.first['userID'], partnerInfo.userID));
      await LinkCode.connectTo('123', userInfo, partnersInfoState, firestore);
    });


    test('pending partner throws error', () async {
      when(partnersInfoState.partnerExist).thenReturn(true);
      when(partnersInfoState.partnerPending).thenReturn(true);
      expectLater(LinkCode.connectTo('123', userInfo, partnersInfoState, firestore), throwsA(isA<PrintableError>()));
    });

    test('linked partner throws error', () async {
      when(partnersInfoState.partnerExist).thenReturn(true);
      when(partnersInfoState.partnerPending).thenReturn(false);
      expectLater(LinkCode.connectTo('123', userInfo, partnersInfoState, firestore), throwsA(isA<PrintableError>()));
    });


    test('link code not in database throws error', () async {
      await firestore.collection(linkCodesCollection).doc('123').delete();
      expectLater(LinkCode.connectTo('123', userInfo, partnersInfoState, firestore), throwsA(isA<PrintableError>()));
    });

    test('link code has no user throws error', () async {
      LinkCode linkCode = LinkCode(linkCode: '123');
      await firestore.collection(linkCodesCollection).doc('123').set(linkCode.toMap());
      expectLater(LinkCode.connectTo('123', userInfo, partnersInfoState, firestore), throwsA(isA<PrintableError>()));
    });

    test('no user with link code throws error', () async {
      await firestore.collection(userInfoCollection).doc(ref.id).delete();
      expectLater(LinkCode.connectTo('123', userInfo, partnersInfoState, firestore), throwsA(isA<PrintableError>()));
    });

    test('user with link code already has partner throws error', () async {
      UserInformation partnerInfo = UserInformation(userID: '1234', partner: ref, linkCode: linkCodeRef, firestore: firestore);
      await firestore.collection(userInfoCollection).doc(ref.id).set(partnerInfo.toMap());
      expectLater(LinkCode.connectTo('123', userInfo, partnersInfoState, firestore), throwsA(isA<PrintableError>()));
    });
  });


  group('acceptRequest', () {
    final FakeFirebaseFirestore firestore = FakeFirebaseFirestore();
    final MockPartnersInfoState partnersInfoState = MockPartnersInfoState();
    final MockUserInfoState userInfoState = MockUserInfoState();
    final MockDocumentReference<UserInformation?> ref = MockDocumentReference<UserInformation?>();
    final UserInformation partnerInfo = UserInformation(userID: '1234', linkCode: MockDocumentReference(), firestore: firestore);
    final UserInformation userInfo = UserInformation(userID: '9876', partner: ref, linkCode: MockDocumentReference(), firestore: firestore);

    setUp(() async {
      when(userInfoState.userInfo).thenReturn(userInfo);
      when(userInfoState.firestore).thenReturn(firestore);
      when(userInfoState.userPending).thenReturn(true);
      when(partnersInfoState.partnerExist).thenReturn(false);
      when(ref.id).thenReturn('1234');
      await firestore.collection(userInfoCollection).doc(userInfo.userID).set(userInfo.toMap());
    });

    test('valid request with incorrect local partner info adds partner to state', () async {
      await LinkCode.acceptRequest(userInfoState, partnersInfoState);
      when(partnersInfoState.addPartner(partnerInfo, userInfo)).thenAnswer((realInvocation) => expect(realInvocation.positionalArguments.first['userID'], partnerInfo.userID));
    });

    test('valid request with correct local partner info notifies listeners', () async {
      when(partnersInfoState.partnersID).thenReturn(userInfo.partnerID);
      when(partnersInfoState.partnerExist).thenReturn(true);
      await LinkCode.acceptRequest(userInfoState, partnersInfoState);
      when(partnersInfoState.notify()).thenReturn(null);
      verify(partnersInfoState.notify());
    });


    test('user already connected to partner throws error', () async {
      when(partnersInfoState.partnerExist).thenReturn(true);
      when(userInfoState.userPending).thenReturn(false);
      expectLater(LinkCode.acceptRequest(userInfoState, partnersInfoState), throwsA(isA<PrintableError>()));
    });

    test('no user info in state throws error', () async {
      when(userInfoState.userInfo).thenReturn(null);
      expectLater(LinkCode.acceptRequest(userInfoState, partnersInfoState), throwsA(isA<PrintableError>()));
    });

    test('no partner in user info throws error', () async {
      UserInformation thisUserInfo = UserInformation(userID: '123', linkCode: MockDocumentReference(), firestore: firestore);
      when(userInfoState.userInfo).thenReturn(thisUserInfo);
      expectLater(LinkCode.acceptRequest(userInfoState, partnersInfoState), throwsA(isA<PrintableError>()));
    });


  });
}