import 'package:flutter/material.dart';

class NewMessageScreen extends StatelessWidget {
  const NewMessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B0B0F),

      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // TOP BAR
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.arrow_back_ios,
                        size: 22, color: Colors.white),
                  ),
                  const SizedBox(width: 12),
                  const Text(
                    "New message",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),

            // Search
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Row(
                children: [
                  const Text(
                    "To:",
                    style: TextStyle(color: Colors.white70, fontSize: 17),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        hintText: "Search",
                        hintStyle: TextStyle(color: Colors.white54),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Options
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Column(
                children: [
                  _option(Icons.group, "Group chat"),
                  _option(Icons.campaign_rounded, "Create a channel"),
                  _option(Icons.auto_awesome, "AI chats"),
                ],
              ),
            ),

            const SizedBox(height: 22),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 18),
              child: Text(
                "Suggested",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            const SizedBox(height: 10),

            // Suggested User
            ListTile(
              leading: const CircleAvatar(
                radius: 26,
                backgroundImage: AssetImage("assets/images/1994894.jpg"),
              ),
              title: const Text("Meta AI",
                  style: TextStyle(color: Colors.white, fontSize: 17)),
              subtitle: const Text("AI",
                  style: TextStyle(color: Colors.white54, fontSize: 14)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _option(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Row(
        children: [
          Container(
            height: 48,
            width: 48,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.08),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: Colors.white70),
          ),
          const SizedBox(width: 14),
          Text(text,
              style: const TextStyle(color: Colors.white, fontSize: 17)),
        ],
      ),
    );
  }
}
