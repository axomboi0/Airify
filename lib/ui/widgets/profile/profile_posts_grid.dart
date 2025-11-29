import 'package:flutter/material.dart';

class ProfilePostsGrid extends StatelessWidget {
  const ProfilePostsGrid({super.key});

  static const demo = [
    'assets/images/0fed79bdb236c10695caad114ef2ef9f.jpg',
    'assets/images/2d3398f0589b88e3f3cea89e22308275.jpg',
    'assets/images/8bf200fb976de182282e9b583633cd4b.jpg',
    'assets/images/631c139d4909d4ce164022f4c387a38a.jpg',
    'assets/images/1994894.jpg', // Typo fixed here
  ];

  // ⭐ FIX: All widget UI must be returned from a build() method.
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 2,
        mainAxisSpacing: 2,
        childAspectRatio: 1,
      ),
      itemCount: 30,
      itemBuilder: (context, i) {
        final img = demo[i % demo.length];
        return Image.asset(img, fit: BoxFit.cover);
      },
    );
  }
}
