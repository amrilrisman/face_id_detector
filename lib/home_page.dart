import 'package:face_detector/data/remote_firebase_source/remote_firebase_soruce.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomePage extends StatefulWidget {
  final String uid;
  const HomePage({Key? key, required this.uid}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    RemoteFirebaseSource().getProfile(uid: widget.uid);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: FlatButton(
          color: Colors.amber,
          onPressed: () {
            RemoteFirebaseSource().logout();
          },
          child: Text("Log out "),
        ),
      ),
    );
  }
}

// import 'dart:math';

// import 'package:face_detector/camera_page.dart';
// import 'package:face_detector/data/remote_local_source/face_service.dart';
// import 'package:flutter/material.dart';
// // import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
// // import 'package:local_auth/local_auth.dart';

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   // final FaceDetector face = FaceDetector(
//   //     options: FaceDetectorOptions(
//   //         performanceMode: FaceDetectorMode.accurate,
//   //         enableContours: true,
//   //         enableLandmarks: true));
//   // final LocalAuthentication localAuth = LocalAuthentication();

//   // _faceDetector() async {
//   //   final List<Face> faces = await face.processImage(InputImage.fromFilePath(
//   //       "/data/user/0/com.example.face_detector/cache/CAP398417208940709661.jpg"));

//   //   for (Face face in faces) {
//   //     final Rect boundingBox = face.boundingBox;

//   //     final double? rotX = face.headEulerAngleX;
//   //     final double? rotY = face.headEulerAngleY;
//   //     final double? rotZ = face.headEulerAngleZ;

//   //     final FaceLandmark? leftEar = face.landmarks[FaceLandmarkType.leftEar];
//   //     print("====>>>>>  ========= ${leftEar!.position}");
//   //     if (leftEar != null) {
//   //       final Point<int> leftEarPos = leftEar.position;
//   //       print("====>>>>>  ========= ${leftEarPos}");
//   //     }

//   //     // If classification was enabled with FaceDetectorOptions:
//   //     if (face.smilingProbability != null) {
//   //       final double? smileProb = face.smilingProbability;
//   //       print("====>>>>>  ========= ${smileProb}");
//   //     }

//   //     // If face tracking was enabled with FaceDetectorOptions:
//   //     if (face.trackingId != null) {
//   //       final int? id = face.trackingId;
//   //       print("====>>>>>  ========= ${id}");
//   //     }
//   //   }
//   // }
//   // _checkkBiometry() async {
//   //     BiometricResult result = await BiometricFingerprint().initAuthentication(
//   //       biometricKey: 'encrypt',
//   //       message: 'Gunakan finger untuk masuk lebih mudah',
//   //       confirmationRequired: true
//   //     );
//   //   await BiometricFingerprint().getPlatformVersion();
//   //   BiometricType type = await BiometricFingerprint.type;

//   //   if (await BiometricFingerprint.isEnabled) {

//   //     if (result.isSuccess && result.hasData) {
//   //       String messageKey = result.data!;
//   //       print(messageKey);
//   //     } else {
//   //       print(result.errorMsg); // showing error
//   //     }
//   //   }
//   // }

//   @override
//   void initState() {
//     super.initState();
//     // _checkkBiometry();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             FlatButton(
//               onPressed: () async {},
//               child: Text('Face plugin face detector'),
//             ),
//             FlatButton(
//               onPressed: () async {
//                 await LocalAuth().fingerAuth().then((value) => print(value));
//               },
//               child: Text('Face plugin local auth'),
//             ),
//             FlatButton(
//               onPressed: () async {
//                 Navigator.push(context,
//                     MaterialPageRoute(builder: (_) => const CameraApp()));
//               },
//               child: Text('Face ml biometri'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
