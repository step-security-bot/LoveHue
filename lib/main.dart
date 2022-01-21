// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:relationship_bars/models/relationship_bar_model.dart';
import 'package:relationship_bars/pages/partners_bars_page.dart';
import 'package:relationship_bars/pages/profile_page.dart';
import 'package:relationship_bars/pages/your_bars_page.dart';
import 'package:relationship_bars/resources/authentication.dart';
import 'package:relationship_bars/firebase_options.dart';
import 'package:relationship_bars/widgets/bar_sliders.dart';
import 'package:relationship_bars/responsive/mobile_screen_layout.dart';
import 'package:relationship_bars/responsive/responsive_layout_screen.dart';
import 'package:relationship_bars/responsive/web_screen_layout.dart';
import 'package:relationship_bars/utils/colors.dart';
import 'package:flutterfire_ui/auth.dart';

import 'Pages/login_page.dart';
import 'database/local_database_handler.dart';
import 'providers/application_state.dart';

/*
TODO: Fix save and cancel buttons
TODO: Bottom Navigation Bar
TODO: Add loading indicators wherever awaiting async. Use listener.
TODO: Only save your bars to local storage when save button pressed, only read from local storage when no value in local relationshipbar variable. Pull from local storage on app init.
TODO: Only read partners bars from local storage when no value in local variable and no connection on app init. Only pull from online DB on app init and partners bars page refresh.
TODO: Show no internet connection message when trying to connect to FireStore and no connection error is given.
TODO: When saving bars, if no internet connection then save bars locally but don't hide the save button.
TODO: When pulling partners bars from online database, check if still linked to partner. If not, delete partner id from local storage.
TODO: Pull down to refresh and refresh button on partners page.
TODO: Settings Screen - Login, Logout, Connect to partner (Display user code), Change display name, etc.
TODO: Store partners displayname when linking to partner.
TODO: Store partners displayname when getting their ID. Display name on your bars page and partners name on partners bars page.
TODO: Firebase implementation - account/auth, storing in server, updating from server
TODO: Allow convert an anonymous account to a permanent account https://firebase.google.com/docs/auth/android/anonymous-auth?authuser=0#convert-an-anonymous-account-to-a-permanent-account
TODO: Beautify UI, don't leave as Instagram clone.
TODO: Delete account option.
TODO: Restrict all pages except login page when not logged in.
TODO: Error if linking to partner who is already linked.
 */

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
      ChangeNotifierProvider(
        create: (context) => ApplicationState(),
        builder: (context, _) => const RelationshipBarsApp(),
      )
  );
}

/* TODO: SHARED PREFERENCES IS BEST FOR STORING SETTINGS */

class RelationshipBarsApp extends StatelessWidget {
  const RelationshipBarsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final auth = FirebaseAuth.instance;

    return MaterialApp(
      showPerformanceOverlay: false,
      title: 'Relationship Bars',
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: mobileBackgroundColor,
      ),
      initialRoute: auth.currentUser == null ? '/login' : '/yours',
      routes: {
        '/login': (context) => const AuthGate(),
        '/profile': (context) => const ProfilePage(),
        '/yours': (context) => const YourBars(),
        '/partners': (context) => const PartnersBars(),
      },
      // home: const ResponsiveLayout(
      //   mobileScreenLayout: MobileScreenLayout(),
      //   webScreenLayout: WebScreenLayout(),
      // ),
    );
  }
}