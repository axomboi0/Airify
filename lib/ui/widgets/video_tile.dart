import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoTile extends StatefulWidget {
  final String videoPath;
  final int reelIndex;

  const VideoTile({
    super.key,
    required this.videoPath,
    required this.reelIndex,
  });

  @override
  State<VideoTile> createState() => _VideoTileState();
}

class _VideoTileState extends State<VideoTile> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.videoPath)
      ..initialize().then((_) {
        setState(() {});
      })
      ..setLooping(true)
      ..setVolume(0)   // 🔇 MUTES PREVIEW
      ..play();

  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_controller.value.isInitialized) {
      return Container(
        height: 200,
        color: Colors.black12,
      );
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(14),
      child: AspectRatio(
        aspectRatio: _controller.value.aspectRatio,
        child: VideoPlayer(_controller),
      ),
    );
  }
}
