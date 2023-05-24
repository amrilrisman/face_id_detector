import 'package:face_detector/data/remote_local_source/face_service.dart';
import 'package:face_detector/home_page.dart';
import 'package:face_detector/login_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  @override
  void initState() {
    super.initState();
    _fingerValidate();
  }

  Future statePage() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString("token");
    Future.delayed(const Duration(seconds: 2), () {
      if (token != null) {
        return Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => HomePage(
                      uid: token,
                    )));
      } else {
        return Navigator.push(
            context, MaterialPageRoute(builder: (_) => const LoginPage()));
      }
    });
  }

  _fingerValidate() async {
    await LocalAuth().fingerAuth().then((value) => print(value));
    await LocalAuth().fingerAuth().then((value) => value ? statePage() : null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'On Boarding',
              style: Theme.of(context).textTheme.headline5,
            ),
            const SizedBox(height: 20,),
            FlatButton(
              onPressed: () {
                _fingerValidate();
              },
              child: const Text("Show Local Authentication"),
            )
          ],
        ),
      ),
    );
  }
}
