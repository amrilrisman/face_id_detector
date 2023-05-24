import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

/// CameraApp is the Main Application.
class CameraApp extends StatefulWidget {
  /// Default Constructor
  const CameraApp({super.key});

  @override
  State<CameraApp> createState() => _CameraAppState();
}

class _CameraAppState extends State<CameraApp> {
  late List<CameraDescription> _cameras;
  late CameraController controller;
  Future _initCamera() async {
    _cameras = await availableCameras();
    controller = CameraController(_cameras[1], ResolutionPreset.max);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            // Handle access errors here.
            Navigator.pop(context);
            break;
          default:
            Navigator.pop(context);
            break;
        }
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _initCamera();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!controller.value.isInitialized) {
      return Container();
    }
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            child: CameraPreview(controller),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: IconButton(
                  onPressed: () async {
                    await controller
                        .takePicture()
                        .then((value) => print("===> ${value.path}"));
                  },
                  icon: Icon(Icons.add),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: IconButton(
                  onPressed: () async {
                    await controller.takePicture();
                  },
                  icon: Icon(Icons.rotate_right),
                ),
                //  FlatButton(
                //   onPressed: () async {
                //   },
                //   child: Text("save"),
                // ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
