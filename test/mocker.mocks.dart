// Mocks generated by Mockito 5.1.0 from annotations
// in lovehue/test/mocker.dart.
// Do not manually edit this file.

// ignore_for_file: subtype_of_sealed_class

import 'dart:async' as _i15;
import 'dart:ui' as _i12;

import 'package:cloud_firestore/cloud_firestore.dart' as _i4;
import 'package:firebase_auth/firebase_auth.dart' as _i7;
import 'package:flutter/material.dart' as _i8;
import 'package:flutter/src/foundation/diagnostics.dart' as _i9;
import 'package:flutterfire_ui/auth.dart' as _i16;
import 'package:lovehue/models/relationship_bar_document.dart' as _i14;
import 'package:lovehue/models/user_information.dart' as _i13;
import 'package:lovehue/providers/application_state.dart' as _i11;
import 'package:lovehue/providers/partners_info_state.dart' as _i3;
import 'package:lovehue/providers/user_info_state.dart' as _i2;
import 'package:lovehue/resources/authentication_info.dart' as _i6;
import 'package:lovehue/utils/app_info_class.dart' as _i5;
import 'package:mockito/mockito.dart' as _i1;
import 'package:package_info_plus/package_info_plus.dart' as _i10;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeUserInfoState_0 extends _i1.Fake implements _i2.UserInfoState {}

class _FakePartnersInfoState_1 extends _i1.Fake implements _i3.PartnersInfoState {}

class _FakeFirebaseFirestore_2 extends _i1.Fake implements _i4.FirebaseFirestore {}

class _FakeAppInfo_3 extends _i1.Fake implements _i5.AppInfo {}

class _FakeAuthenticationInfo_4 extends _i1.Fake implements _i6.AuthenticationInfo {}

class _FakeFirebaseAuth_5 extends _i1.Fake implements _i7.FirebaseAuth {}

class _FakeValueNotifier_6<T> extends _i1.Fake implements _i8.ValueNotifier<T> {}

class _FakeCollectionReference_7<T extends Object?> extends _i1.Fake implements _i4.CollectionReference<T> {}

class _FakeDocumentSnapshot_8<T extends Object?> extends _i1.Fake implements _i4.DocumentSnapshot<T> {}

class _FakeDocumentReference_9<T extends Object?> extends _i1.Fake implements _i4.DocumentReference<T> {}

class _FakeWidget_10 extends _i1.Fake implements _i8.Widget {
  @override
  String toString({_i8.DiagnosticLevel? minLevel = _i8.DiagnosticLevel.info}) => super.toString();
}

class _FakeInheritedWidget_11 extends _i1.Fake implements _i8.InheritedWidget {
  @override
  String toString({_i8.DiagnosticLevel? minLevel = _i8.DiagnosticLevel.info}) => super.toString();
}

class _FakeDiagnosticsNode_12 extends _i1.Fake implements _i8.DiagnosticsNode {
  @override
  String toString(
          {_i9.TextTreeConfiguration? parentConfiguration, _i8.DiagnosticLevel? minLevel = _i8.DiagnosticLevel.info}) =>
      super.toString();
}

class _FakeActionCodeSettings_13 extends _i1.Fake implements _i7.ActionCodeSettings {}

class _FakePackageInfo_14 extends _i1.Fake implements _i10.PackageInfo {}

/// A class which mocks [ApplicationState].
///
/// See the documentation for Mockito's code generation for more information.
class MockApplicationState extends _i1.Mock implements _i11.ApplicationState {
  MockApplicationState() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i11.ApplicationLoginState get loginState =>
      (super.noSuchMethod(Invocation.getter(#loginState), returnValue: _i11.ApplicationLoginState.loggedOut)
          as _i11.ApplicationLoginState);

  @override
  set loginState(_i11.ApplicationLoginState? _loginState) =>
      super.noSuchMethod(Invocation.setter(#loginState, _loginState), returnValueForMissingStub: null);

  @override
  _i2.UserInfoState get userInfoState =>
      (super.noSuchMethod(Invocation.getter(#userInfoState), returnValue: _FakeUserInfoState_0()) as _i2.UserInfoState);

  @override
  _i3.PartnersInfoState get partnersInfoState =>
      (super.noSuchMethod(Invocation.getter(#partnersInfoState), returnValue: _FakePartnersInfoState_1())
          as _i3.PartnersInfoState);

  @override
  _i4.FirebaseFirestore get firestore =>
      (super.noSuchMethod(Invocation.getter(#firestore), returnValue: _FakeFirebaseFirestore_2())
          as _i4.FirebaseFirestore);

  @override
  _i5.AppInfo get appInfo =>
      (super.noSuchMethod(Invocation.getter(#appInfo), returnValue: _FakeAppInfo_3()) as _i5.AppInfo);

  @override
  _i6.AuthenticationInfo get authenticationInfo =>
      (super.noSuchMethod(Invocation.getter(#authenticationInfo), returnValue: _FakeAuthenticationInfo_4())
          as _i6.AuthenticationInfo);

  @override
  _i7.FirebaseAuth get auth =>
      (super.noSuchMethod(Invocation.getter(#auth), returnValue: _FakeFirebaseAuth_5()) as _i7.FirebaseAuth);

  @override
  bool get hasListeners => (super.noSuchMethod(Invocation.getter(#hasListeners), returnValue: false) as bool);

  @override
  void addListener(_i12.VoidCallback? listener) =>
      super.noSuchMethod(Invocation.method(#addListener, [listener]), returnValueForMissingStub: null);

  @override
  void removeListener(_i12.VoidCallback? listener) =>
      super.noSuchMethod(Invocation.method(#removeListener, [listener]), returnValueForMissingStub: null);

  @override
  void dispose() => super.noSuchMethod(Invocation.method(#dispose, []), returnValueForMissingStub: null);

  @override
  void notifyListeners() =>
      super.noSuchMethod(Invocation.method(#notifyListeners, []), returnValueForMissingStub: null);
}

/// A class which mocks [UserInfoState].
///
/// See the documentation for Mockito's code generation for more information.
class MockUserInfoState extends _i1.Mock implements _i2.UserInfoState {
  MockUserInfoState() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.PartnersInfoState get partnersInfoState =>
      (super.noSuchMethod(Invocation.getter(#partnersInfoState), returnValue: _FakePartnersInfoState_1())
          as _i3.PartnersInfoState);

  @override
  _i4.FirebaseFirestore get firestore =>
      (super.noSuchMethod(Invocation.getter(#firestore), returnValue: _FakeFirebaseFirestore_2())
          as _i4.FirebaseFirestore);

  @override
  set firestore(_i4.FirebaseFirestore? _firestore) =>
      super.noSuchMethod(Invocation.setter(#firestore, _firestore), returnValueForMissingStub: null);

  @override
  set userInfo(_i13.UserInformation? _userInfo) =>
      super.noSuchMethod(Invocation.setter(#userInfo, _userInfo), returnValueForMissingStub: null);

  @override
  set latestRelationshipBarDoc(_i14.RelationshipBarDocument? _latestRelationshipBarDoc) =>
      super.noSuchMethod(Invocation.setter(#latestRelationshipBarDoc, _latestRelationshipBarDoc),
          returnValueForMissingStub: null);

  @override
  bool get barsChanged => (super.noSuchMethod(Invocation.getter(#barsChanged), returnValue: false) as bool);

  @override
  set barsChanged(bool? _barsChanged) =>
      super.noSuchMethod(Invocation.setter(#barsChanged, _barsChanged), returnValueForMissingStub: null);

  @override
  bool get barsReset => (super.noSuchMethod(Invocation.getter(#barsReset), returnValue: false) as bool);

  @override
  set barsReset(bool? _barsReset) =>
      super.noSuchMethod(Invocation.setter(#barsReset, _barsReset), returnValueForMissingStub: null);

  @override
  bool get userExist => (super.noSuchMethod(Invocation.getter(#userExist), returnValue: false) as bool);

  @override
  bool get userPending => (super.noSuchMethod(Invocation.getter(#userPending), returnValue: false) as bool);

  @override
  bool get partnerLinked => (super.noSuchMethod(Invocation.getter(#partnerLinked), returnValue: false) as bool);

  @override
  bool get hasListeners => (super.noSuchMethod(Invocation.getter(#hasListeners), returnValue: false) as bool);

  @override
  void setupUserInfoSubscription() =>
      super.noSuchMethod(Invocation.method(#setupUserInfoSubscription, []), returnValueForMissingStub: null);

  @override
  void addUser(_i13.UserInformation? newUserInfo) =>
      super.noSuchMethod(Invocation.method(#addUser, [newUserInfo]), returnValueForMissingStub: null);

  @override
  void removeUser() => super.noSuchMethod(Invocation.method(#removeUser, []), returnValueForMissingStub: null);

  @override
  void barChange() => super.noSuchMethod(Invocation.method(#barChange, []), returnValueForMissingStub: null);

  @override
  void resetBarChange() => super.noSuchMethod(Invocation.method(#resetBarChange, []), returnValueForMissingStub: null);

  @override
  _i15.Future<void> connectTo(String? linkCode) => (super.noSuchMethod(Invocation.method(#connectTo, [linkCode]),
      returnValue: Future<void>.value(), returnValueForMissingStub: Future<void>.value()) as _i15.Future<void>);

  @override
  _i15.Future<void> acceptRequest() => (super.noSuchMethod(Invocation.method(#acceptRequest, []),
      returnValue: Future<void>.value(), returnValueForMissingStub: Future<void>.value()) as _i15.Future<void>);

  @override
  _i15.Future<void> unlink() => (super.noSuchMethod(Invocation.method(#unlink, []),
      returnValue: Future<void>.value(), returnValueForMissingStub: Future<void>.value()) as _i15.Future<void>);

  @override
  void addListener(_i12.VoidCallback? listener) =>
      super.noSuchMethod(Invocation.method(#addListener, [listener]), returnValueForMissingStub: null);

  @override
  void removeListener(_i12.VoidCallback? listener) =>
      super.noSuchMethod(Invocation.method(#removeListener, [listener]), returnValueForMissingStub: null);

  @override
  void dispose() => super.noSuchMethod(Invocation.method(#dispose, []), returnValueForMissingStub: null);

  @override
  void notifyListeners() =>
      super.noSuchMethod(Invocation.method(#notifyListeners, []), returnValueForMissingStub: null);
}

/// A class which mocks [PartnersInfoState].
///
/// See the documentation for Mockito's code generation for more information.
class MockPartnersInfoState extends _i1.Mock implements _i3.PartnersInfoState {
  MockPartnersInfoState() {
    _i1.throwOnMissingStub(this);
  }

  @override
  set partnersInfo(_i13.UserInformation? _partnersInfo) =>
      super.noSuchMethod(Invocation.setter(#partnersInfo, _partnersInfo), returnValueForMissingStub: null);

  @override
  _i8.ValueNotifier<String> get partnersName =>
      (super.noSuchMethod(Invocation.getter(#partnersName), returnValue: _FakeValueNotifier_6<String>())
          as _i8.ValueNotifier<String>);

  @override
  set partnersName(_i8.ValueNotifier<String>? _partnersName) =>
      super.noSuchMethod(Invocation.setter(#partnersName, _partnersName), returnValueForMissingStub: null);

  @override
  bool get partnerExist => (super.noSuchMethod(Invocation.getter(#partnerExist), returnValue: false) as bool);

  @override
  bool get partnerPending => (super.noSuchMethod(Invocation.getter(#partnerPending), returnValue: false) as bool);

  @override
  bool get hasListeners => (super.noSuchMethod(Invocation.getter(#hasListeners), returnValue: false) as bool);

  @override
  void notify() => super.noSuchMethod(Invocation.method(#notify, []), returnValueForMissingStub: null);

  @override
  void setupPartnerInfoSubscription(_i13.UserInformation? currentUserInfo) =>
      super.noSuchMethod(Invocation.method(#setupPartnerInfoSubscription, [currentUserInfo]),
          returnValueForMissingStub: null);

  @override
  void addPartner(_i13.UserInformation? newPartnerInfo, _i13.UserInformation? currentUserInfo) => super
      .noSuchMethod(Invocation.method(#addPartner, [newPartnerInfo, currentUserInfo]), returnValueForMissingStub: null);

  @override
  void removePartner(_i13.UserInformation? currentUserInfo) =>
      super.noSuchMethod(Invocation.method(#removePartner, [currentUserInfo]), returnValueForMissingStub: null);

  @override
  void addListener(_i12.VoidCallback? listener) =>
      super.noSuchMethod(Invocation.method(#addListener, [listener]), returnValueForMissingStub: null);

  @override
  void removeListener(_i12.VoidCallback? listener) =>
      super.noSuchMethod(Invocation.method(#removeListener, [listener]), returnValueForMissingStub: null);

  @override
  void dispose() => super.noSuchMethod(Invocation.method(#dispose, []), returnValueForMissingStub: null);

  @override
  void notifyListeners() =>
      super.noSuchMethod(Invocation.method(#notifyListeners, []), returnValueForMissingStub: null);
}

/// A class which mocks [DocumentReference].
///
/// See the documentation for Mockito's code generation for more information.
// ignore: must_be_immutable
class MockDocumentReference<T extends Object?> extends _i1.Mock implements _i4.DocumentReference<T> {
  MockDocumentReference() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.FirebaseFirestore get firestore =>
      (super.noSuchMethod(Invocation.getter(#firestore), returnValue: _FakeFirebaseFirestore_2())
          as _i4.FirebaseFirestore);

  @override
  String get id => (super.noSuchMethod(Invocation.getter(#id), returnValue: '') as String);

  @override
  _i4.CollectionReference<T> get parent =>
      (super.noSuchMethod(Invocation.getter(#parent), returnValue: _FakeCollectionReference_7<T>())
          as _i4.CollectionReference<T>);

  @override
  String get path => (super.noSuchMethod(Invocation.getter(#path), returnValue: '') as String);

  @override
  _i4.CollectionReference<Map<String, dynamic>> collection(String? collectionPath) =>
      (super.noSuchMethod(Invocation.method(#collection, [collectionPath]),
              returnValue: _FakeCollectionReference_7<Map<String, dynamic>>())
          as _i4.CollectionReference<Map<String, dynamic>>);

  @override
  _i15.Future<void> delete() => (super.noSuchMethod(Invocation.method(#delete, []),
      returnValue: Future<void>.value(), returnValueForMissingStub: Future<void>.value()) as _i15.Future<void>);

  @override
  _i15.Future<void> update(Map<String, Object?>? data) => (super.noSuchMethod(Invocation.method(#update, [data]),
      returnValue: Future<void>.value(), returnValueForMissingStub: Future<void>.value()) as _i15.Future<void>);

  @override
  _i15.Future<_i4.DocumentSnapshot<T>> get([_i4.GetOptions? options]) =>
      (super.noSuchMethod(Invocation.method(#get, [options]),
              returnValue: Future<_i4.DocumentSnapshot<T>>.value(_FakeDocumentSnapshot_8<T>()))
          as _i15.Future<_i4.DocumentSnapshot<T>>);

  @override
  _i15.Stream<_i4.DocumentSnapshot<T>> snapshots({bool? includeMetadataChanges = false}) =>
      (super.noSuchMethod(Invocation.method(#snapshots, [], {#includeMetadataChanges: includeMetadataChanges}),
          returnValue: Stream<_i4.DocumentSnapshot<T>>.empty()) as _i15.Stream<_i4.DocumentSnapshot<T>>);

  @override
  _i15.Future<void> set(T? data, [_i4.SetOptions? options]) =>
      (super.noSuchMethod(Invocation.method(#set, [data, options]),
          returnValue: Future<void>.value(), returnValueForMissingStub: Future<void>.value()) as _i15.Future<void>);

  @override
  _i4.DocumentReference<R> withConverter<R>({_i4.FromFirestore<R>? fromFirestore, _i4.ToFirestore<R>? toFirestore}) =>
      (super.noSuchMethod(
          Invocation.method(#withConverter, [], {#fromFirestore: fromFirestore, #toFirestore: toFirestore}),
          returnValue: _FakeDocumentReference_9<R>()) as _i4.DocumentReference<R>);
}

/// A class which mocks [UserInformation].
///
/// See the documentation for Mockito's code generation for more information.
class MockUserInformation extends _i1.Mock implements _i13.UserInformation {
  MockUserInformation() {
    _i1.throwOnMissingStub(this);
  }

  @override
  String get userID => (super.noSuchMethod(Invocation.getter(#userID), returnValue: '') as String);

  @override
  set displayName(String? _displayName) =>
      super.noSuchMethod(Invocation.setter(#displayName, _displayName), returnValueForMissingStub: null);

  @override
  set partner(_i4.DocumentReference<Object?>? _partner) =>
      super.noSuchMethod(Invocation.setter(#partner, _partner), returnValueForMissingStub: null);

  @override
  _i4.DocumentReference<Object?> get linkCode =>
      (super.noSuchMethod(Invocation.getter(#linkCode), returnValue: _FakeDocumentReference_9<Object?>())
          as _i4.DocumentReference<Object?>);

  @override
  set linkCode(_i4.DocumentReference<Object?>? _linkCode) =>
      super.noSuchMethod(Invocation.setter(#linkCode, _linkCode), returnValueForMissingStub: null);

  @override
  bool get linkPending => (super.noSuchMethod(Invocation.getter(#linkPending), returnValue: false) as bool);

  @override
  set linkPending(bool? _linkPending) =>
      super.noSuchMethod(Invocation.setter(#linkPending, _linkPending), returnValueForMissingStub: null);

  @override
  _i4.FirebaseFirestore get firestore =>
      (super.noSuchMethod(Invocation.getter(#firestore), returnValue: _FakeFirebaseFirestore_2())
          as _i4.FirebaseFirestore);

  @override
  set firestore(_i4.FirebaseFirestore? _firestore) =>
      super.noSuchMethod(Invocation.setter(#firestore, _firestore), returnValueForMissingStub: null);

  @override
  Map<String, Object?> toMap() =>
      (super.noSuchMethod(Invocation.method(#toMap, []), returnValue: <String, Object?>{}) as Map<String, Object?>);

  @override
  _i4.DocumentReference<_i13.UserInformation?> getUserInDatabase() => (super.noSuchMethod(
      Invocation.method(#getUserInDatabase, []),
      returnValue: _FakeDocumentReference_9<_i13.UserInformation?>()) as _i4.DocumentReference<_i13.UserInformation?>);

  @override
  _i15.Future<void> firestoreSet() => (super.noSuchMethod(Invocation.method(#firestoreSet, []),
      returnValue: Future<void>.value(), returnValueForMissingStub: Future<void>.value()) as _i15.Future<void>);

  @override
  _i15.Future<void> firestoreUpdateColumns(Map<String, Object?>? data) =>
      (super.noSuchMethod(Invocation.method(#firestoreUpdateColumns, [data]),
          returnValue: Future<void>.value(), returnValueForMissingStub: Future<void>.value()) as _i15.Future<void>);

  @override
  _i15.Future<void> firestoreDelete() => (super.noSuchMethod(Invocation.method(#firestoreDelete, []),
      returnValue: Future<void>.value(), returnValueForMissingStub: Future<void>.value()) as _i15.Future<void>);

  @override
  _i15.Future<void> deleteUserData(
          _i8.BuildContext? context, _i7.FirebaseAuth? auth, _i6.AuthenticationInfo? authenticationInfo) =>
      (super.noSuchMethod(Invocation.method(#deleteUserData, [context, auth, authenticationInfo]),
          returnValue: Future<void>.value(), returnValueForMissingStub: Future<void>.value()) as _i15.Future<void>);

  @override
  _i15.Future<void> setupUserInDatabase(_i2.UserInfoState? userInfoState) =>
      (super.noSuchMethod(Invocation.method(#setupUserInDatabase, [userInfoState]),
          returnValue: Future<void>.value(), returnValueForMissingStub: Future<void>.value()) as _i15.Future<void>);
}

/// A class which mocks [BuildContext].
///
/// See the documentation for Mockito's code generation for more information.
class MockBuildContext extends _i1.Mock implements _i8.BuildContext {
  MockBuildContext() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i8.Widget get widget =>
      (super.noSuchMethod(Invocation.getter(#widget), returnValue: _FakeWidget_10()) as _i8.Widget);

  @override
  bool get debugDoingBuild => (super.noSuchMethod(Invocation.getter(#debugDoingBuild), returnValue: false) as bool);

  @override
  _i8.InheritedWidget dependOnInheritedElement(_i8.InheritedElement? ancestor, {Object? aspect}) =>
      (super.noSuchMethod(Invocation.method(#dependOnInheritedElement, [ancestor], {#aspect: aspect}),
          returnValue: _FakeInheritedWidget_11()) as _i8.InheritedWidget);

  @override
  void visitAncestorElements(bool Function(_i8.Element)? visitor) =>
      super.noSuchMethod(Invocation.method(#visitAncestorElements, [visitor]), returnValueForMissingStub: null);

  @override
  void visitChildElements(_i8.ElementVisitor? visitor) =>
      super.noSuchMethod(Invocation.method(#visitChildElements, [visitor]), returnValueForMissingStub: null);

  @override
  _i8.DiagnosticsNode describeElement(String? name,
          {_i9.DiagnosticsTreeStyle? style = _i9.DiagnosticsTreeStyle.errorProperty}) =>
      (super.noSuchMethod(Invocation.method(#describeElement, [name], {#style: style}),
          returnValue: _FakeDiagnosticsNode_12()) as _i8.DiagnosticsNode);

  @override
  _i8.DiagnosticsNode describeWidget(String? name,
          {_i9.DiagnosticsTreeStyle? style = _i9.DiagnosticsTreeStyle.errorProperty}) =>
      (super.noSuchMethod(Invocation.method(#describeWidget, [name], {#style: style}),
          returnValue: _FakeDiagnosticsNode_12()) as _i8.DiagnosticsNode);

  @override
  List<_i8.DiagnosticsNode> describeMissingAncestor({Type? expectedAncestorType}) => (super.noSuchMethod(
      Invocation.method(#describeMissingAncestor, [], {#expectedAncestorType: expectedAncestorType}),
      returnValue: <_i8.DiagnosticsNode>[]) as List<_i8.DiagnosticsNode>);

  @override
  _i8.DiagnosticsNode describeOwnershipChain(String? name) =>
      (super.noSuchMethod(Invocation.method(#describeOwnershipChain, [name]), returnValue: _FakeDiagnosticsNode_12())
          as _i8.DiagnosticsNode);
}

/// A class which mocks [AuthenticationInfo].
///
/// See the documentation for Mockito's code generation for more information.
class MockAuthenticationInfo extends _i1.Mock implements _i6.AuthenticationInfo {
  MockAuthenticationInfo() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.ActionCodeSettings get actionCodeSettings =>
      (super.noSuchMethod(Invocation.getter(#actionCodeSettings), returnValue: _FakeActionCodeSettings_13())
          as _i7.ActionCodeSettings);

  @override
  set actionCodeSettings(_i7.ActionCodeSettings? _actionCodeSettings) =>
      super.noSuchMethod(Invocation.setter(#actionCodeSettings, _actionCodeSettings), returnValueForMissingStub: null);

  @override
  _i10.PackageInfo get packageInfo =>
      (super.noSuchMethod(Invocation.getter(#packageInfo), returnValue: _FakePackageInfo_14()) as _i10.PackageInfo);

  @override
  set packageInfo(_i10.PackageInfo? _packageInfo) =>
      super.noSuchMethod(Invocation.setter(#packageInfo, _packageInfo), returnValueForMissingStub: null);

  @override
  List<_i16.ProviderConfiguration> get providerConfigs =>
      (super.noSuchMethod(Invocation.getter(#providerConfigs), returnValue: <_i16.ProviderConfiguration>[])
          as List<_i16.ProviderConfiguration>);

  @override
  set providerConfigs(List<_i16.ProviderConfiguration>? _providerConfigs) =>
      super.noSuchMethod(Invocation.setter(#providerConfigs, _providerConfigs), returnValueForMissingStub: null);

  @override
  _i15.Future<void> signInAnonymously(_i8.BuildContext? context, {_i7.FirebaseAuth? auth}) =>
      (super.noSuchMethod(Invocation.method(#signInAnonymously, [context], {#auth: auth}),
          returnValue: Future<void>.value(), returnValueForMissingStub: Future<void>.value()) as _i15.Future<void>);

  @override
  void afterSignIn(_i8.BuildContext? context) =>
      super.noSuchMethod(Invocation.method(#afterSignIn, [context]), returnValueForMissingStub: null);

  @override
  _i15.Future<bool> reauthenticate(_i8.BuildContext? context, _i7.FirebaseAuth? auth) =>
      (super.noSuchMethod(Invocation.method(#reauthenticate, [context, auth]), returnValue: Future<bool>.value(false))
          as _i15.Future<bool>);
}

/// A class which mocks [AppInfo].
///
/// See the documentation for Mockito's code generation for more information.
class MockAppInfo extends _i1.Mock implements _i5.AppInfo {
  MockAppInfo() {
    _i1.throwOnMissingStub(this);
  }

  @override
  String get appName => (super.noSuchMethod(Invocation.getter(#appName), returnValue: '') as String);

  @override
  String get aboutText => (super.noSuchMethod(Invocation.getter(#aboutText), returnValue: '') as String);
}