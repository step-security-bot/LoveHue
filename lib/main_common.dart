// TODO: Setup new email and developer name
// Copyright (C) 2022 Conner Lukes <clukes@icloud.com>
// All rights reserved.

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:provider/provider.dart';

import '../pages/sign_in_page.dart';
import '../providers/application_state.dart';
import '../providers/partners_info_state.dart';
import '../providers/user_info_state.dart';
import '../responsive/responsive_screen_layout.dart';
import '../utils/theme_data.dart';
import 'utils/app_info_class.dart';

late final AppInfo appInfo;
late final PackageInfo packageInfo;

/// Entry point with initializers.
void mainCommon(FirebaseOptions firebaseOptions, AppInfo flavorAppInfo) async {
  WidgetsFlutterBinding.ensureInitialized();

  appInfo = flavorAppInfo;
  packageInfo = await PackageInfo.fromPlatform();
  await Firebase.initializeApp(
    options: firebaseOptions,
  );

  // Add licenses for the fonts.
  LicenseRegistry.addLicense(() async* {
    String license = await rootBundle.loadString('assets/google_fonts/DMSansOFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
    license = await rootBundle.loadString('assets/google_fonts/PoppinsOFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });
  // Only uses the bundled google fonts, prevents fetching from online.
  GoogleFonts.config.allowRuntimeFetching = false;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  final PartnersInfoState partnersInfoState = PartnersInfoState();
  final UserInfoState userInfoState = UserInfoState(firestore, partnersInfoState);
  final ApplicationState applicationState = ApplicationState(userInfoState, partnersInfoState, firestore, FirebaseAuth.instance);

  final List<ChangeNotifierProvider<ChangeNotifier>> providers = [
    ChangeNotifierProvider<UserInfoState>.value(value: userInfoState),
    ChangeNotifierProvider<PartnersInfoState>.value(value: partnersInfoState),
    ChangeNotifierProvider<ApplicationState>.value(value: applicationState),
  ];

  runApp(RelationshipBarsApp(providers: providers));
}

/// Initial widget for the app.
class RelationshipBarsApp extends StatelessWidget {
  const RelationshipBarsApp({Key? key, required this.providers}) : super(key: key);

  final List<ChangeNotifierProvider<ChangeNotifier>> providers;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      // Setup providers for states.
      providers: providers,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        showPerformanceOverlay: false,
        title: appInfo.appName,
        //TODO: Set to correct name.
        // Currently there is only one theme, a light one.
        theme: lightThemeData,
        home: AnnotatedRegion<SystemUiOverlayStyle>(
          // Ensures that the status bar stays dark with light text.
          value: SystemUiOverlayStyle.dark.copyWith(statusBarIconBrightness: Brightness.light),
          child: SafeArea(
            child: StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.active) {
                  if (snapshot.hasData) {
                    return responsiveLayout;
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('Error: ${snapshot.error}'),
                    );
                  }
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return const SignInPage();
              },
            ),
          ),
        ),
      ),
    );
  }
}
