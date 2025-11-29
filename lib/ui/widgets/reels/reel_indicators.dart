// lib/ui/widgets/reels/reel_indicators.dart
import 'package:flutter/material.dart';

class ReelIndicators extends StatelessWidget {
  final bool muted;
  final bool paused;
  final bool show; // visibility toggle

  const ReelIndicators({
    Key? key,
    required this.muted,
    required this.paused,
    this.show = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!show) return const SizedBox.shrink();

    Widget icon;
    String label = '';

    if (paused) {
      icon = const Icon(Icons.pause_circle_filled, color: Colors.white70, size: 64);
    } else if (muted) {
      icon = const Icon(Icons.volume_off, color: Colors.white70, size: 48);
      label = 'Muted';
    } else {
      icon = const Icon(Icons.volume_up, color: Colors.white70, size: 48);
    }

    return Center(
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 250),
        opacity: 1,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ScaleTransition(
              scale: const AlwaysStoppedAnimation(1.0),
              child: icon,
            ),
            if (label.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 6.0),
                child: Text(label, style: const TextStyle(color: Colors.white70)),
              ),
          ],
        ),
      ),
    );
  }
}
