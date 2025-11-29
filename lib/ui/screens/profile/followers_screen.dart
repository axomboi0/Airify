import 'package:flutter/material.dart';

class FollowersScreen extends StatelessWidget {
  final String title;
  const FollowersScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final sample = List.generate(20, (i) => "User ${i + 1}");

    return Scaffold(
      backgroundColor: const Color(0xFF0B0B0F),
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: sample.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const CircleAvatar(
              backgroundImage: AssetImage("assets/images/dp.jpg"),
            ),
            title: Text(sample[index], style: const TextStyle(color: Colors.white)),
            trailing: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text("Follow", style: TextStyle(color: Colors.white)),
            ),
          );
        },
      ),
    );
  }
}
