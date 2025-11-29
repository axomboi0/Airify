import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/explore_screen.dart';
import 'screens/chat_list_screen.dart';
import 'screens/profile/profile_screen.dart';
import 'widgets/bottom_nav_bar.dart';
import '../core/utils/fast_swipe_physics.dart';

class AppShell extends StatefulWidget {
  const AppShell({super.key});

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  late final PageController _pageController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  final List<Widget> _screens = [
    const HomeScreen(),
    const ExploreScreen(),
    ChatListScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: const Color(0xFF0B0B0F),
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            physics: const FastPageScrollPhysics(),
            onPageChanged: (index) {
              setState(() => _currentIndex = index);
            },
            children: _screens,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: BottomNavBar(
              currentIndex: _currentIndex,
              onTap: (index) {
                setState(() => _currentIndex = index);
                _pageController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 180),
                  curve: Curves.easeOut,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
