import 'dart:ui';
import 'package:flutter/material.dart';

class GlassCard extends StatelessWidget {
  final Widget child;
  final double radius;
  final EdgeInsets padding;

  const GlassCard({
    super.key,
    required this.child,
    this.radius = 24,
    this.padding = const EdgeInsets.all(16),
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
        child: Container(
          padding: padding,
          decoration: BoxDecoration(
            color: const Color.fromRGBO(255, 255, 255, 0.05), // soft dark glass
            borderRadius: BorderRadius.circular(radius),
            border: Border.all(
              color: const Color.fromRGBO(255, 255, 255, 0.15),
              width: 1,
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}
