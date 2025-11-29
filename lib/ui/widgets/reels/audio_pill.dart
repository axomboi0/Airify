import 'package:flutter/material.dart';

class AudioPill extends StatelessWidget {
  final String audioInfo;

  const AudioPill({
    super.key,
    required this.audioInfo,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.35),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.music_note, color: Colors.white, size: 16),
          const SizedBox(width: 6),
          SizedBox(
            width: 120,
            child: Text(
              audioInfo,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
