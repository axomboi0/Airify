import 'package:flutter/material.dart';

class FullScreenViewer extends StatelessWidget {
  final String image;

  const FullScreenViewer({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => Navigator.pop(context), // tap anywhere to close

        child: Stack(
          children: [
            Center(
              child: InteractiveViewer(
                clipBehavior: Clip.none,
                minScale: 0.8,
                maxScale: 4.0,
                child: Hero(
                  tag: image, // smooth transition animation
                  child: Image.asset(image, fit: BoxFit.contain),
                ),
              ),
            ),

            // Close button
            Positioned(
              top: 40,
              right: 20,
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Icon(
                  Icons.close,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
