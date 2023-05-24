import 'package:face_detector/my_app.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

final GlobalKey<NavigatorState> contextNav = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
