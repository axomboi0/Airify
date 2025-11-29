import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class ReelRecordScreen extends StatefulWidget {
  const ReelRecordScreen({super.key});

  @override
  State<ReelRecordScreen> createState() => _ReelRecordScreenState();
}

class _ReelRecordScreenState extends State<ReelRecordScreen> {
  CameraController? controller;

  @override
  void initState() {
    super.initState();
    initCam();
  }

  Future<void> initCam() async {
    final cams = await availableCameras();
    controller = CameraController(cams[0], ResolutionPreset.high);
    await controller!.initialize();
    setState(() {});
  }

  Future<void> record() async {
    if (!controller!.value.isRecordingVideo) {
      await controller!.startVideoRecording();
    } else {
      final video = await controller!.stopVideoRecording();
      print("Saved video: ${video.path}");
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Reel Recorder"),
        backgroundColor: Colors.black,
      ),
      body: controller == null || !controller!.value.isInitialized
          ? const Center(child: CircularProgressIndicator())
          : Stack(
        children: [
          CameraPreview(controller!),
          Align(
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(
              onPressed: record,
              child: Text(
                controller!.value.isRecordingVideo ? "Stop" : "Record",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
