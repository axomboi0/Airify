import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class LiveStartScreen extends StatefulWidget {
  const LiveStartScreen({super.key});

  @override
  State<LiveStartScreen> createState() => _LiveStartScreenState();
}

class _LiveStartScreenState extends State<LiveStartScreen> {
  CameraController? controller;

  @override
  void initState() {
    super.initState();
    initCamera();
  }

  Future<void> initCamera() async {
    final cams = await availableCameras();
    controller = CameraController(cams[1], ResolutionPreset.medium);
    await controller!.initialize();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Go Live"),
        backgroundColor: Colors.black,
      ),
      body: controller == null || !controller!.value.isInitialized
          ? const Center(child: CircularProgressIndicator())
          : CameraPreview(controller!),
    );
  }
}
