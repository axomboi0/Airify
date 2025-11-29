import 'package:flutter/material.dart';
import '../common/create_button.dart';

class ProfileHeaderSliver extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final String username;
  final String profileImage;
  final int posts;
  final int followers;
  final int following;

  ProfileHeaderSliver({
    required this.expandedHeight,
    required this.username,
    required this.profileImage,
    required this.posts,
    required this.followers,
    required this.following,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    bool isCollapsed = shrinkOffset > expandedHeight - 80;

    return Container(
      color: Colors.black,
      child: Stack(
        fit: StackFit.expand,
        children: [
          // ---------------- PROFILE + STATS ----------------
          Positioned(
            left: 16,
            bottom: 20,
            child: Row(
              children: [
                CircleAvatar(
                  radius: isCollapsed ? 24 : 42,
                  backgroundImage: AssetImage(profileImage),
                ),
                const SizedBox(width: 18),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      username,
                      style: TextStyle(
                        fontSize: isCollapsed ? 18 : 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 6),

                    Row(
                      children: [
                        _stat("Posts", posts),
                        const SizedBox(width: 18),
                        _stat("Followers", followers),
                        const SizedBox(width: 18),
                        _stat("Following", following),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),

          // ---------------- SETTINGS BUTTON (LEFT TOP) ----------------
          Positioned(
            top: MediaQuery.of(context).padding.top + 10,
            left: 16,
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "/settings");
              },
              child: const Icon(Icons.menu, size: 30, color: Colors.white),
            ),
          ),

          // ---------------- CREATE BUTTON (RIGHT TOP) ----------------
          Positioned(
            top: MediaQuery.of(context).padding.top + 10,
            right: 16,
            child: const CreateButton(),
          ),
        ],
      ),
    );
  }

  Widget _stat(String title, int count) {
    return Column(
      children: [
        Text(
          count.toString(),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          title,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 13,
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => 80;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}
