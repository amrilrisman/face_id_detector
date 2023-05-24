import 'package:face_detector/main.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

class LocalAuth {
  final LocalAuthentication auth = LocalAuthentication();
  Future _canCheckAuthenticaiton() async =>
      await auth.canCheckBiometrics || await auth.isDeviceSupported();

  Future fingerAuth() async {
    try {
      if (!await _canCheckAuthenticaiton()) {
        ScaffoldMessenger.of(contextNav.currentContext!).showSnackBar(
          const SnackBar(
            content: Text(
              "Fiture FingerPrint tidak tersedia",
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.red,
          ),
        );
        return false;
      } else {
        return auth.authenticate(localizedReason: "use finget to authentication ");
        // return true;
      }
    } catch (e) {
      print('error $e');
    }
  }
}
