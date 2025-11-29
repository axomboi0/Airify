import 'package:flutter/material.dart';

class ProfileTabBar extends StatelessWidget {
  const ProfileTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: TabBar(
        padding: EdgeInsets.zero,
        labelPadding: EdgeInsets.zero,
        splashFactory: NoSplash.splashFactory,
        overlayColor: MaterialStateProperty.all(Colors.transparent),
        indicatorColor: Colors.white,
        indicatorWeight: 1.5,
        labelColor: Colors.white,
        unselectedLabelColor: const Color(0xFF8E8E8E),
        tabs: const [
          Tab(icon: Icon(Icons.grid_on_outlined, size: 22)),
          Tab(icon: Icon(Icons.movie_outlined, size: 22)),
          Tab(icon: Icon(Icons.person_pin_circle_outlined, size: 22)),
        ],
      ),
    );
  }
}
