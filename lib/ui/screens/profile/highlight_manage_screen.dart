import 'package:flutter/material.dart';

class HighlightManageScreen extends StatelessWidget {
  const HighlightManageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B0B0F),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Manage Highlights",
          style: TextStyle(color: Colors.white),
        ),
      ),

      body: const Center(
        child: Text(
          "Highlight manager coming soon...",
          style: TextStyle(color: Colors.white70, fontSize: 16),
        ),
      ),
    );
  }
}
