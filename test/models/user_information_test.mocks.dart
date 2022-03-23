// Mocks generated by Mockito 5.1.0 from annotations
// in lovehue/test/models/user_information_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i5;

import 'package:firebase_auth/firebase_auth.dart' as _i3;
import 'package:firebase_auth_platform_interface/firebase_auth_platform_interface.dart'
    as _i2;
import 'package:firebase_core/firebase_core.dart' as _i4;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeUserMetadata_0 extends _i1.Fake implements _i2.UserMetadata {}

class _FakeIdTokenResult_1 extends _i1.Fake implements _i2.IdTokenResult {}

class _FakeUserCredential_2 extends _i1.Fake implements _i3.UserCredential {}

class _FakeConfirmationResult_3 extends _i1.Fake
    implements _i3.ConfirmationResult {}

class _FakeUser_4 extends _i1.Fake implements _i3.User {}

class _FakeFirebaseApp_5 extends _i1.Fake implements _i4.FirebaseApp {}

class _FakeActionCodeInfo_6 extends _i1.Fake implements _i2.ActionCodeInfo {}

/// A class which mocks [User].
///
/// See the documentation for Mockito's code generation for more information.
class MockUser extends _i1.Mock implements _i3.User {
  MockUser() {
    _i1.throwOnMissingStub(this);
  }

  @override
  bool get emailVerified =>
      (super.noSuchMethod(Invocation.getter(#emailVerified), returnValue: false)
          as bool);
  @override
  bool get isAnonymous =>
      (super.noSuchMethod(Invocation.getter(#isAnonymous), returnValue: false)
          as bool);
  @override
  _i2.UserMetadata get metadata =>
      (super.noSuchMethod(Invocation.getter(#metadata),
          returnValue: _FakeUserMetadata_0()) as _i2.UserMetadata);
  @override
  List<_i2.UserInfo> get providerData =>
      (super.noSuchMethod(Invocation.getter(#providerData),
          returnValue: <_i2.UserInfo>[]) as List<_i2.UserInfo>);
  @override
  String get uid =>
      (super.noSuchMethod(Invocation.getter(#uid), returnValue: '') as String);
  @override
  _i5.Future<void> delete() =>
      (super.noSuchMethod(Invocation.method(#delete, []),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i5.Future<void>);
  @override
  _i5.Future<String> getIdToken([bool? forceRefresh = false]) =>
      (super.noSuchMethod(Invocation.method(#getIdToken, [forceRefresh]),
          returnValue: Future<String>.value('')) as _i5.Future<String>);
  @override
  _i5.Future<_i2.IdTokenResult> getIdTokenResult(
          [bool? forceRefresh = false]) =>
      (super.noSuchMethod(Invocation.method(#getIdTokenResult, [forceRefresh]),
              returnValue:
                  Future<_i2.IdTokenResult>.value(_FakeIdTokenResult_1()))
          as _i5.Future<_i2.IdTokenResult>);
  @override
  _i5.Future<_i3.UserCredential> linkWithCredential(
          _i2.AuthCredential? credential) =>
      (super.noSuchMethod(Invocation.method(#linkWithCredential, [credential]),
              returnValue:
                  Future<_i3.UserCredential>.value(_FakeUserCredential_2()))
          as _i5.Future<_i3.UserCredential>);
  @override
  _i5.Future<_i3.UserCredential> linkWithPopup(_i2.AuthProvider? provider) =>
      (super.noSuchMethod(Invocation.method(#linkWithPopup, [provider]),
              returnValue:
                  Future<_i3.UserCredential>.value(_FakeUserCredential_2()))
          as _i5.Future<_i3.UserCredential>);
  @override
  _i5.Future<_i3.ConfirmationResult> linkWithPhoneNumber(String? phoneNumber,
          [_i3.RecaptchaVerifier? verifier]) =>
      (super.noSuchMethod(
              Invocation.method(#linkWithPhoneNumber, [phoneNumber, verifier]),
              returnValue: Future<_i3.ConfirmationResult>.value(
                  _FakeConfirmationResult_3()))
          as _i5.Future<_i3.ConfirmationResult>);
  @override
  _i5.Future<_i3.UserCredential> reauthenticateWithCredential(
          _i2.AuthCredential? credential) =>
      (super.noSuchMethod(
              Invocation.method(#reauthenticateWithCredential, [credential]),
              returnValue:
                  Future<_i3.UserCredential>.value(_FakeUserCredential_2()))
          as _i5.Future<_i3.UserCredential>);
  @override
  _i5.Future<void> reload() =>
      (super.noSuchMethod(Invocation.method(#reload, []),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i5.Future<void>);
  @override
  _i5.Future<void> sendEmailVerification(
          [_i2.ActionCodeSettings? actionCodeSettings]) =>
      (super.noSuchMethod(
          Invocation.method(#sendEmailVerification, [actionCodeSettings]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i5.Future<void>);
  @override
  _i5.Future<_i3.User> unlink(String? providerId) =>
      (super.noSuchMethod(Invocation.method(#unlink, [providerId]),
              returnValue: Future<_i3.User>.value(_FakeUser_4()))
          as _i5.Future<_i3.User>);
  @override
  _i5.Future<void> updateEmail(String? newEmail) =>
      (super.noSuchMethod(Invocation.method(#updateEmail, [newEmail]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i5.Future<void>);
  @override
  _i5.Future<void> updatePassword(String? newPassword) =>
      (super.noSuchMethod(Invocation.method(#updatePassword, [newPassword]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i5.Future<void>);
  @override
  _i5.Future<void> updatePhoneNumber(
          _i2.PhoneAuthCredential? phoneCredential) =>
      (super.noSuchMethod(
          Invocation.method(#updatePhoneNumber, [phoneCredential]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i5.Future<void>);
  @override
  _i5.Future<void> updateDisplayName(String? displayName) =>
      (super.noSuchMethod(Invocation.method(#updateDisplayName, [displayName]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i5.Future<void>);
  @override
  _i5.Future<void> updatePhotoURL(String? photoURL) =>
      (super.noSuchMethod(Invocation.method(#updatePhotoURL, [photoURL]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i5.Future<void>);
  @override
  _i5.Future<void> updateProfile({String? displayName, String? photoURL}) =>
      (super.noSuchMethod(
          Invocation.method(#updateProfile, [],
              {#displayName: displayName, #photoURL: photoURL}),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i5.Future<void>);
  @override
  _i5.Future<void> verifyBeforeUpdateEmail(String? newEmail,
          [_i2.ActionCodeSettings? actionCodeSettings]) =>
      (super.noSuchMethod(
          Invocation.method(
              #verifyBeforeUpdateEmail, [newEmail, actionCodeSettings]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i5.Future<void>);
}

/// A class which mocks [FirebaseAuth].
///
/// See the documentation for Mockito's code generation for more information.
class MockFirebaseAuth extends _i1.Mock implements _i3.FirebaseAuth {
  MockFirebaseAuth() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.FirebaseApp get app => (super.noSuchMethod(Invocation.getter(#app),
      returnValue: _FakeFirebaseApp_5()) as _i4.FirebaseApp);
  @override
  set app(_i4.FirebaseApp? _app) =>
      super.noSuchMethod(Invocation.setter(#app, _app),
          returnValueForMissingStub: null);
  @override
  set tenantId(String? tenantId) =>
      super.noSuchMethod(Invocation.setter(#tenantId, tenantId),
          returnValueForMissingStub: null);
  @override
  Map<dynamic, dynamic> get pluginConstants =>
      (super.noSuchMethod(Invocation.getter(#pluginConstants),
          returnValue: <dynamic, dynamic>{}) as Map<dynamic, dynamic>);
  @override
  _i5.Future<void> useEmulator(String? origin) =>
      (super.noSuchMethod(Invocation.method(#useEmulator, [origin]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i5.Future<void>);
  @override
  _i5.Future<void> useAuthEmulator(String? host, int? port) =>
      (super.noSuchMethod(Invocation.method(#useAuthEmulator, [host, port]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i5.Future<void>);
  @override
  _i5.Future<void> applyActionCode(String? code) =>
      (super.noSuchMethod(Invocation.method(#applyActionCode, [code]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i5.Future<void>);
  @override
  _i5.Future<_i2.ActionCodeInfo> checkActionCode(String? code) =>
      (super.noSuchMethod(Invocation.method(#checkActionCode, [code]),
              returnValue:
                  Future<_i2.ActionCodeInfo>.value(_FakeActionCodeInfo_6()))
          as _i5.Future<_i2.ActionCodeInfo>);
  @override
  _i5.Future<void> confirmPasswordReset({String? code, String? newPassword}) =>
      (super.noSuchMethod(
          Invocation.method(#confirmPasswordReset, [],
              {#code: code, #newPassword: newPassword}),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i5.Future<void>);
  @override
  _i5.Future<_i3.UserCredential> createUserWithEmailAndPassword(
          {String? email, String? password}) =>
      (super.noSuchMethod(
              Invocation.method(#createUserWithEmailAndPassword, [],
                  {#email: email, #password: password}),
              returnValue:
                  Future<_i3.UserCredential>.value(_FakeUserCredential_2()))
          as _i5.Future<_i3.UserCredential>);
  @override
  _i5.Future<List<String>> fetchSignInMethodsForEmail(String? email) => (super
          .noSuchMethod(Invocation.method(#fetchSignInMethodsForEmail, [email]),
              returnValue: Future<List<String>>.value(<String>[]))
      as _i5.Future<List<String>>);
  @override
  _i5.Future<_i3.UserCredential> getRedirectResult() =>
      (super.noSuchMethod(Invocation.method(#getRedirectResult, []),
              returnValue:
                  Future<_i3.UserCredential>.value(_FakeUserCredential_2()))
          as _i5.Future<_i3.UserCredential>);
  @override
  bool isSignInWithEmailLink(String? emailLink) => (super.noSuchMethod(
      Invocation.method(#isSignInWithEmailLink, [emailLink]),
      returnValue: false) as bool);
  @override
  _i5.Stream<_i3.User?> authStateChanges() =>
      (super.noSuchMethod(Invocation.method(#authStateChanges, []),
          returnValue: Stream<_i3.User?>.empty()) as _i5.Stream<_i3.User?>);
  @override
  _i5.Stream<_i3.User?> idTokenChanges() =>
      (super.noSuchMethod(Invocation.method(#idTokenChanges, []),
          returnValue: Stream<_i3.User?>.empty()) as _i5.Stream<_i3.User?>);
  @override
  _i5.Stream<_i3.User?> userChanges() =>
      (super.noSuchMethod(Invocation.method(#userChanges, []),
          returnValue: Stream<_i3.User?>.empty()) as _i5.Stream<_i3.User?>);
  @override
  _i5.Future<void> sendPasswordResetEmail(
          {String? email, _i2.ActionCodeSettings? actionCodeSettings}) =>
      (super.noSuchMethod(
          Invocation.method(#sendPasswordResetEmail, [],
              {#email: email, #actionCodeSettings: actionCodeSettings}),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i5.Future<void>);
  @override
  _i5.Future<void> sendSignInLinkToEmail(
          {String? email, _i2.ActionCodeSettings? actionCodeSettings}) =>
      (super.noSuchMethod(
          Invocation.method(#sendSignInLinkToEmail, [],
              {#email: email, #actionCodeSettings: actionCodeSettings}),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i5.Future<void>);
  @override
  _i5.Future<void> setLanguageCode(String? languageCode) =>
      (super.noSuchMethod(Invocation.method(#setLanguageCode, [languageCode]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i5.Future<void>);
  @override
  _i5.Future<void> setSettings(
          {bool? appVerificationDisabledForTesting,
          String? userAccessGroup,
          String? phoneNumber,
          String? smsCode,
          bool? forceRecaptchaFlow}) =>
      (super.noSuchMethod(
          Invocation.method(#setSettings, [], {
            #appVerificationDisabledForTesting:
                appVerificationDisabledForTesting,
            #userAccessGroup: userAccessGroup,
            #phoneNumber: phoneNumber,
            #smsCode: smsCode,
            #forceRecaptchaFlow: forceRecaptchaFlow
          }),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i5.Future<void>);
  @override
  _i5.Future<void> setPersistence(_i2.Persistence? persistence) =>
      (super.noSuchMethod(Invocation.method(#setPersistence, [persistence]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i5.Future<void>);
  @override
  _i5.Future<_i3.UserCredential> signInAnonymously() =>
      (super.noSuchMethod(Invocation.method(#signInAnonymously, []),
              returnValue:
                  Future<_i3.UserCredential>.value(_FakeUserCredential_2()))
          as _i5.Future<_i3.UserCredential>);
  @override
  _i5.Future<_i3.UserCredential> signInWithCredential(
          _i2.AuthCredential? credential) =>
      (super.noSuchMethod(
              Invocation.method(#signInWithCredential, [credential]),
              returnValue:
                  Future<_i3.UserCredential>.value(_FakeUserCredential_2()))
          as _i5.Future<_i3.UserCredential>);
  @override
  _i5.Future<_i3.UserCredential> signInWithCustomToken(String? token) =>
      (super.noSuchMethod(Invocation.method(#signInWithCustomToken, [token]),
              returnValue:
                  Future<_i3.UserCredential>.value(_FakeUserCredential_2()))
          as _i5.Future<_i3.UserCredential>);
  @override
  _i5.Future<_i3.UserCredential> signInWithEmailAndPassword(
          {String? email, String? password}) =>
      (super.noSuchMethod(
              Invocation.method(#signInWithEmailAndPassword, [],
                  {#email: email, #password: password}),
              returnValue:
                  Future<_i3.UserCredential>.value(_FakeUserCredential_2()))
          as _i5.Future<_i3.UserCredential>);
  @override
  _i5.Future<_i3.UserCredential> signInWithEmailLink(
          {String? email, String? emailLink}) =>
      (super.noSuchMethod(
          Invocation.method(
              #signInWithEmailLink, [], {#email: email, #emailLink: emailLink}),
          returnValue:
              Future<_i3.UserCredential>.value(_FakeUserCredential_2())) as _i5
          .Future<_i3.UserCredential>);
  @override
  _i5.Future<_i3.ConfirmationResult> signInWithPhoneNumber(String? phoneNumber,
          [_i3.RecaptchaVerifier? verifier]) =>
      (super.noSuchMethod(
          Invocation.method(#signInWithPhoneNumber, [phoneNumber, verifier]),
          returnValue: Future<_i3.ConfirmationResult>.value(
              _FakeConfirmationResult_3())) as _i5
          .Future<_i3.ConfirmationResult>);
  @override
  _i5.Future<_i3.UserCredential> signInWithPopup(_i2.AuthProvider? provider) =>
      (super.noSuchMethod(Invocation.method(#signInWithPopup, [provider]),
              returnValue:
                  Future<_i3.UserCredential>.value(_FakeUserCredential_2()))
          as _i5.Future<_i3.UserCredential>);
  @override
  _i5.Future<void> signInWithRedirect(_i2.AuthProvider? provider) =>
      (super.noSuchMethod(Invocation.method(#signInWithRedirect, [provider]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i5.Future<void>);
  @override
  _i5.Future<void> signOut() =>
      (super.noSuchMethod(Invocation.method(#signOut, []),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i5.Future<void>);
  @override
  _i5.Future<String> verifyPasswordResetCode(String? code) =>
      (super.noSuchMethod(Invocation.method(#verifyPasswordResetCode, [code]),
          returnValue: Future<String>.value('')) as _i5.Future<String>);
  @override
  _i5.Future<void> verifyPhoneNumber(
          {String? phoneNumber,
          _i2.PhoneVerificationCompleted? verificationCompleted,
          _i2.PhoneVerificationFailed? verificationFailed,
          _i2.PhoneCodeSent? codeSent,
          _i2.PhoneCodeAutoRetrievalTimeout? codeAutoRetrievalTimeout,
          String? autoRetrievedSmsCodeForTesting,
          Duration? timeout = const Duration(seconds: 30),
          int? forceResendingToken}) =>
      (super.noSuchMethod(
          Invocation.method(#verifyPhoneNumber, [], {
            #phoneNumber: phoneNumber,
            #verificationCompleted: verificationCompleted,
            #verificationFailed: verificationFailed,
            #codeSent: codeSent,
            #codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
            #autoRetrievedSmsCodeForTesting: autoRetrievedSmsCodeForTesting,
            #timeout: timeout,
            #forceResendingToken: forceResendingToken
          }),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i5.Future<void>);
}
