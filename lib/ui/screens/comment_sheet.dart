import 'package:flutter/material.dart';
import '../../../core/models/reel.dart';

class CommentSheet extends StatelessWidget {
  final Reel reel;

  const CommentSheet({super.key, required this.reel});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.65,
      minChildSize: 0.45,
      maxChildSize: 0.9,
      builder: (context, controller) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            children: [
              const SizedBox(height: 10),
              Container(
                height: 4,
                width: 40,
                decoration: BoxDecoration(
                  color: Colors.white24,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              const SizedBox(height: 20),

              Text(
                "${reel.comments} Comments",
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),

              const SizedBox(height: 10),

              Expanded(
                child: ListView.builder(
                  controller: controller,
                  itemCount: 10,
                  itemBuilder: (_, i) => ListTile(
                    leading: const CircleAvatar(
                      backgroundColor: Colors.white24,
                    ),
                    title: const Text("user123",
                        style: TextStyle(color: Colors.white)),
                    subtitle: const Text(
                      "This reel looks amazing 🔥",
                      style: TextStyle(color: Colors.white70),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
