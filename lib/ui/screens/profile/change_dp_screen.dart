import 'package:flutter/material.dart';

class ChangeDpScreen extends StatelessWidget {
  final String currentDp;

  const ChangeDpScreen({super.key, required this.currentDp});

  @override
  Widget build(BuildContext context) {
    final samples = [
      currentDp,
      "assets/images/1994894.jpg",
      "assets/images/0fed79bdb236c10695caad114ef2ef9f.jpg",
      "assets/images/2d3398f0589b88e3f3cea89e22308275.jpg",
      "assets/images/631c139d4909d4ce164022f4c387a38a.jpg",
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF0B0B0F),

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Change profile photo"),
      ),

      body: Column(
        children: [
          const SizedBox(height: 20),

          Hero(
            tag: "profile_dp",
            child: CircleAvatar(
              radius: 70,
              backgroundImage: AssetImage(currentDp),
            ),
          ),

          const SizedBox(height: 20),
          const Divider(color: Colors.white24),

          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: samples.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
              ),
              itemBuilder: (context, index) {
                final img = samples[index];
                return GestureDetector(
                  onTap: () => Navigator.pop(context, img),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(14),
                    child: Image.asset(img, fit: BoxFit.cover),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
