// lib/ui/widgets/reels/reel_heart_animation.dart
import 'package:flutter/material.dart';

class ReelHeartAnimation extends StatelessWidget {
  final Animation<double> scale;
  const ReelHeartAnimation({Key? key, required this.scale}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ScaleTransition(
        scale: scale,
        child: const Icon(Icons.favorite, color: Colors.white, size: 110),
      ),
    );
  }
}
