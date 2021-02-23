import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:provider/provider.dart';
import 'package:tastebooster/pages/Settings/appConfig.dart';
import 'package:tastebooster/pages/LikedTracks/likedTracksPage.dart';
import 'package:tastebooster/pages/loadingPage.dart';
import 'package:tastebooster/pages/Login/loginPage.dart';
import 'package:tastebooster/pages/MainGame/mainPage.dart';
import 'package:tastebooster/pages/Settings/settingsPage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sentry/sentry.dart';
import 'package:tastebooster/providers/AuthCredentialsProvider.dart';
import 'package:tastebooster/providers/GameContentProvider.dart';
import 'package:tastebooster/providers/PlayerProvider.dart';

final sentry = SentryClient(
  dsn:
      "https://1802b9a8f319473d81ace7f194619aa0@o474302.ingest.sentry.io/5510453",
  environmentAttributes: Event(
    environment: 'production',
    release: "tastebooster@buildNumber:2",
    extra: {
      'device_system': Platform.operatingSystem,
      'os_version': Platform.operatingSystemVersion,
      'build_number': 2,
    },
  ),
);
Future<void> main() async {
  // main for production
  // runZonedGuarded(
  //   () => runApp(MultiProvider(
  //     providers: [
  //       ChangeNotifierProvider(create: (_) => AuthCredentialsProvider()),
  //       Provider(create: (_) => PlayerProvider()),
  //       Provider(create: (_) => GameContentProvider()),
  //     ],
  //     child: MyApp(),
  //   )),
  //   (error, stackTrace) async {
  //     await sentry.captureException(
  //       exception: error,
  //       stackTrace: stackTrace,
  //     );
  //   },
  // );

  // main for debug
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => AuthCredentialsProvider()),
    Provider(create: (_) => PlayerProvider()),
    Provider(create: (_) => GameContentProvider()),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OverlaySupport(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Tastebooster',
        theme: PagesConfig.buildThemeData(),
        routes: {
          '/main': (context) => MainPage(),
          '/settings': (context) => SettingsPage(),
          '/likedTracks': (context) => LikedTracksPage(),
          '/login': (context) => LoginPage(),
          '/loading': (context) => LoadingPage(),
        },
        initialRoute: '/loading',
      ),
    );
  }

  static Future<bool> sharedPrefsReadIsLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'isLoggedIn';
    final value = prefs.getBool(key);
    if (value == null) {
      return false;
    }
    return value;
  }

  static void sharedPrefsSaveIsLoggedIn({bool value}) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'isLoggedIn';
    prefs.setBool(key, value);
  }

  static Future<bool> sharedPrefsReadIsInstaFollowed() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'isInstaFollowed';
    final value = prefs.getBool(key);
    return value;
  }

  static void sharedPrefsSaveIsInstaFollowed({bool value}) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'isInstaFollowed';
    prefs.setBool(key, value);
  }
}
