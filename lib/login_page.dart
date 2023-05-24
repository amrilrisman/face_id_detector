import 'package:face_detector/data/remote_firebase_source/remote_firebase_soruce.dart';
import 'package:face_detector/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Page Login",
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(
              height: 20,
            ),
            FlatButton(
              color: Colors.amber,
              onPressed: () {
                RemoteFirebaseSource().authentication();
              },
              child: Text("Click TO Login"),
            )
          ],
        ),
      ),
    );
  }
}
