import 'package:flutter/material.dart';
import 'glass_container.dart';

class StoryBubble extends StatelessWidget {
  final String image;
  final String username;

  const StoryBubble({super.key, required this.image, required this.username});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          GlassContainer(
            height: 72,
            width: 72,
            borderRadius: 50,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset(image, fit: BoxFit.cover),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            username,
            style: const TextStyle(color: Colors.white, fontSize: 11),
          ),
        ],
      ),
    );
  }
}
