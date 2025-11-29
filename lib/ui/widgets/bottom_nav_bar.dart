import 'dart:ui';
import 'package:flutter/material.dart';
import './common/create_button.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 95,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            bottom: 20,
            left: 25,
            right: 25,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(45),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 25, sigmaY: 25),
                child: Container(
                  height: 70,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(255, 255, 255, 0.08),
                    borderRadius: BorderRadius.circular(45),
                    border: Border.all(
                      color: const Color.fromRGBO(255, 255, 255, 0.15),
                      width: 1,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _navItem(Icons.home_rounded, 0),
                      _navItem(Icons.explore_rounded, 1),
                      _navItem(Icons.chat_bubble_rounded, 2),
                      _navItem(Icons.person_rounded, 3),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // SMALL ICONS WITH LARGER TOUCH AREA
  Widget _navItem(IconData icon, int i) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => onTap(i),
      child: Container(
        width: 60,
        height: 60,
        alignment: Alignment.center,
        child: Icon(
          icon,
          size: currentIndex == i ? 28 : 23,
          color: currentIndex == i
              ? Colors.white
              : const Color.fromRGBO(255, 255, 255, 0.55),
        ),
      ),
    );
  }
}
