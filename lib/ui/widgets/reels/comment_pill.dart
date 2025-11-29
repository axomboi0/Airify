import 'package:flutter/material.dart';

class CommentPill extends StatelessWidget {
  final String hint;
  final String avatarAsset;
  final VoidCallback? onTap;

  const CommentPill({
    Key? key,
    this.hint = 'Add a comment…',
    required this.avatarAsset,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bottomPad = MediaQuery.of(context).padding.bottom;
    return Positioned(
      left: 16,
      right: 16,
      bottom: 10 + bottomPad,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 52,
          padding: const EdgeInsets.symmetric(horizontal: 14),
          decoration: BoxDecoration(
            color: const Color(0xFF222222),
            borderRadius: BorderRadius.circular(30),
            boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.35), blurRadius: 6)],
          ),
          child: Row(
            children: [
              CircleAvatar(radius: 16, backgroundImage: AssetImage(avatarAsset)),
              const SizedBox(width: 12),
              Expanded(
                child: Text(hint, style: const TextStyle(color: Colors.white70, fontSize: 15)),
              ),
              const SizedBox(width: 8),
              Icon(Icons.emoji_emotions_outlined, color: Colors.white54),
            ],
          ),
        ),
      ),
    );
  }
}
