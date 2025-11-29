import 'package:flutter/material.dart';
import '../../widgets/profile/profile_header_sliver.dart';
import '../../widgets/profile/profile_action_buttons.dart';
import '../../widgets/profile/profile_highlights.dart';
import '../../widgets/profile/profile_tabbar.dart';
import '../../widgets/profile/profile_posts_grid.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: const Color(0xFF0B0B0F),
        body: NestedScrollView(
          headerSliverBuilder: (context, innerScrolled) => [
            SliverPersistentHeader(
              pinned: false,
              delegate: ProfileHeaderSliver(
                expandedHeight: 220,
                username: "John Red",
                profileImage: "assets/images/p1.jpg",
                posts: 135,
                followers: 16000,
                following: 122,
              ),
            ),
            const SliverToBoxAdapter(child: ProfileActionButtons()),

            const ProfileHighlights(),

            SliverPersistentHeader(
              pinned: true,
              delegate: _SliverAppBarDelegate(const ProfileTabBar()),
            ),
          ],
          body: TabBarView(
            children: [
              const ProfilePostsGrid(),
              Center(
                child: Text("Reels coming soon",
                    style: TextStyle(color: Colors.white54)),
              ),
              Center(
                child: Text("Tagged coming soon",
                    style: TextStyle(color: Colors.white54)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;

  const _SliverAppBarDelegate(this.child);

  @override
  double get minExtent => 48;

  @override
  double get maxExtent => 48;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(
      child: Container(
        color: Colors.black,
        child: child,
      ),
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) => false;
}
