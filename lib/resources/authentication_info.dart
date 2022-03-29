// ignore_for_file: unused_import

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../main_common.dart';
import '../responsive/responsive_screen_layout.dart';

class AuthenticationInfo {
  AuthenticationInfo(this.packageInfo) {
    ActionCodeSettings actionCodeSettings = ActionCodeSettings(
      // URL you want to redirect back to. The domain (www.example.com) for this
      // URL must be whitelisted in the Firebase Console.
      url: 'http://lovehue.page.link/',
      // This must be true
      handleCodeInApp: true,
      // installIfNotAvailable
      androidInstallApp: true,
      androidPackageName: packageInfo.packageName,
      iOSBundleId: packageInfo.packageName,
    );

    providerConfigs = <ProviderConfiguration>[
      EmailLinkProviderConfiguration(actionCodeSettings: actionCodeSettings),
    ];
  }

  /// [ActionCodeSettings] for the email link login.
  late final ActionCodeSettings actionCodeSettings;

  late final PackageInfo packageInfo;

  /// Configs for different auth providers.
  late final List<ProviderConfiguration> providerConfigs;

  /// Implements [signInAnonymously] to allow sign in without email.
  Future<void> signInAnonymously(BuildContext context, {FirebaseAuth? auth}) async {
/* TODO: HAVE LOADING OVERLAY */
    auth ??= FirebaseAuth.instance;
    await auth.signInAnonymously();
    if (auth.currentUser != null) {
      afterSignIn(context);
    } else {
/* TODO: Display Error */
      debugPrint("signInAnonymously: Sign In Error.");
    }
  }

  /// Build and navigate to [ResponsiveLayout].
  void afterSignIn(BuildContext context) {
    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_) => responsiveLayout), (route) => false);
  }

  Future<bool> reauthenticate(BuildContext context, FirebaseAuth auth) {
    return showReauthenticateDialog(
      context: context,
      providerConfigs: providerConfigs,
      auth: auth,
      onSignedIn: () => Navigator.of(context).pop(true),
    );
  }
}
