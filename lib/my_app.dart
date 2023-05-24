import 'package:face_detector/home_page.dart';
import 'package:face_detector/login_page.dart';
import 'package:face_detector/main.dart';
import 'package:face_detector/splash_screen_page.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: contextNav,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreenPage(),
      // home: const MyHomePage(title: 'Face Detector'),
    );
  }
}
