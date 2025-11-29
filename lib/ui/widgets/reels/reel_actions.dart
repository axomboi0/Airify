import 'package:flutter/material.dart';

class ReelActions extends StatelessWidget {
  final bool isLiked;
  final int likes;
  final int comments;
  final VoidCallback? onShare;
  final VoidCallback? onComments;
  final VoidCallback? onLike;
  final VoidCallback? onMore;

  const ReelActions({
    Key? key,
    this.isLiked = false,
    required this.likes,
    required this.comments,
    this.onShare,
    this.onComments,
    this.onLike,
    this.onMore,
  }) : super(key: key);

  Widget _countText(int n) {
    return Text(
      n >= 1000 ? '${(n / 1000).toStringAsFixed(1)}K' : '$n',
      style: const TextStyle(color: Colors.white, fontSize: 13),
    );
  }

  Widget _png(String name, {double size = 32}) {
    return Image.asset(
      'assets/reel_icons/$name.png',
      width: size,
      height: size,
      fit: BoxFit.contain,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 14,
      bottom: 140,   // FIXED — Instagram accurate
      child: Column(
        children: [
          GestureDetector(
            onTap: onLike,
            child: isLiked
                ? _png("like_filled", size: 34)
                : _png("like_outline", size: 34),
          ),
          const SizedBox(height: 6),
          _countText(likes),

          const SizedBox(height: 22),

          GestureDetector(
            onTap: onComments,
            child: _png("comment", size: 32),
          ),
          const SizedBox(height: 6),
          _countText(comments),

          const SizedBox(height: 22),

          GestureDetector(
            onTap: onShare,
            child: _png("share", size: 30),
          ),

          const SizedBox(height: 26),

          GestureDetector(
            onTap: onMore,
            child: _png("more", size: 26),
          ),
        ],
      ),
    );
  }
}
