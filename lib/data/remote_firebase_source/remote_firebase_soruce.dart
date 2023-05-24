import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:face_detector/home_page.dart';
import 'package:face_detector/login_page.dart';
import 'package:face_detector/main.dart';
import 'package:face_detector/splash_screen_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RemoteFirebaseSource {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Future authentication() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    try {
      final response = await auth.signInWithEmailAndPassword(
          email: "amrilrisman@gmail.com", password: "12345678");
      if (response.user != null) {
        pref.setString('token', response.user!.uid);
        Navigator.push(
            contextNav.currentContext!,
            MaterialPageRoute(
                builder: (_) => HomePage(
                      uid: response.user!.uid,
                    )));
      }
    } on FirebaseAuthException catch (e) {
      print('error ${e}');
    }
  }

  Future logout() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.clear();
    Navigator.push(contextNav.currentContext!,
        MaterialPageRoute(builder: (_) => const SplashScreenPage()));
  }

  Future getProfile({required String uid}) async {
    try {
      final data = await firestore.collection("profile").get();
      print(
          "====>>>>  ${data.docs.where((element) => element.id == uid).first.get('data')}");

    } catch (e) {
      // print("=== errorr +==>>> ${e}");
      throw "";
    }
  }
}
