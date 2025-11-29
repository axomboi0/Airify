import 'package:flutter/material.dart';

class FollowingScreen extends StatelessWidget {
  final String title;
  const FollowingScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B0B0F),
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: 15,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const CircleAvatar(
              backgroundImage: AssetImage("assets/images/dp.jpg"),
            ),
            title: Text("User $index", style: const TextStyle(color: Colors.white)),
            trailing: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text("Following", style: TextStyle(color: Colors.white)),
            ),
          );
        },
      ),
    );
  }
}
