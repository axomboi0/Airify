import 'dart:ui';
import 'package:flutter/material.dart';

class ExplorePillBar extends StatelessWidget {
  final int selected;
  final ValueChanged<int> onChanged;

  const ExplorePillBar({
    super.key,
    required this.selected,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
        child: Container(
          height: 55,
          margin: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.05),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: Colors.white.withOpacity(0.08)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
                blurRadius: 20,
                offset: const Offset(0, 6),
              )
            ],
          ),
          child: Row(
            children: [
              _buildPill(context, 0, "All"),
              _buildPill(context, 1, "Reels"),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPill(BuildContext context, int index, String text) {
    final isSelected = selected == index;

    return Expanded(
      child: GestureDetector(
        // ⭐ FIX: Navigation logic removed. The widget now only reports the tap.
        onTap: () => onChanged(index),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeOut,
          margin: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color:
            isSelected ? Colors.white.withOpacity(0.18) : Colors.transparent,
            borderRadius: BorderRadius.circular(18),
            border: isSelected
                ? Border.all(color: Colors.white.withOpacity(0.20))
                : null,
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.white60,
                fontWeight: FontWeight.w600,
                fontSize: 15,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
