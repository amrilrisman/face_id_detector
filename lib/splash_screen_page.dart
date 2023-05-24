import 'package:face_detector/login_page.dart';
import 'package:face_detector/main.dart';
import 'package:face_detector/on_boarding.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () async {
      SharedPreferences pref = await SharedPreferences.getInstance();
      if (pref.getString('token') != null) {
        Navigator.push(contextNav.currentContext!,
            MaterialPageRoute(builder: (_) => const OnBoardingPage()));
      } else {
        Navigator.push(contextNav.currentContext!,
            MaterialPageRoute(builder: (_) => const LoginPage()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Splash Screen",
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
    );
  }
}
