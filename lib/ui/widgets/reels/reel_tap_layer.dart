// lib/ui/widgets/reels/reel_tap_layer.dart
import 'package:flutter/material.dart';

class ReelTapLayer extends StatelessWidget {
  final VoidCallback? onTopTap; // mute toggle
  final VoidCallback? onBottomTap; // play/pause
  final VoidCallback? onDoubleTap;

  const ReelTapLayer({
    Key? key,
    this.onTopTap,
    this.onBottomTap,
    this.onDoubleTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Column(
        children: [
          Expanded(
            flex: 35,
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: onTopTap,
            ),
          ),
          Expanded(
            flex: 65,
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: onBottomTap,
              onDoubleTap: onDoubleTap,
            ),
          ),
        ],
      ),
    );
  }
}
