import 'dart:ui';
import 'package:flutter/material.dart';

class GlassContainer extends StatelessWidget {
  final double? height;
  final double? width;
  final Widget child;
  final double borderRadius;
  final double blur;

  const GlassContainer({
    super.key,
    required this.child,
    this.height,
    this.width,
    this.borderRadius = 24,
    this.blur = 18,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Stack(
        children: [
          // Blur layer (this is the magic fix)
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
            child: Container(
              height: height,
              width: width,
              color: Colors.transparent, // This layer is just for the blur
            ),
          ),

          // The actual glass content
          Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius),
              color: Colors.white.withOpacity(0.07),
              border: Border.all(
                color: Colors.white.withOpacity(0.15),
                width: 1,
              ),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.white.withOpacity(0.18),
                  Colors.white.withOpacity(0.03),
                ],
              ),
            ),
            child: child,
          ),
        ],
      ),
    );
  }
}
