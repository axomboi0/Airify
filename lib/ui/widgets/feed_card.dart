import 'package:flutter/material.dart';
import 'glass_card.dart';

class FeedCard extends StatelessWidget {
  final String username;
  final String location;
  final String postImage;
  final String avatarImage;

  const FeedCard({
    super.key,
    required this.username,
    required this.location,
    required this.postImage,
    required this.avatarImage,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),

      child: GlassCard(
        radius: 28,
        padding: const EdgeInsets.all(18),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// TOP ROW
            Row(
              children: [
                CircleAvatar(
                  radius: 22,
                  backgroundImage: AssetImage(avatarImage),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      username,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      location,
                      style: const TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 0.6),
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
                const Spacer(),

                /// ERROR-FREE COLOR
                const Icon(
                  Icons.more_horiz,
                  color: Color.fromRGBO(255, 255, 255, 0.8),
                ),
              ],
            ),

            const SizedBox(height: 14),

            /// POST IMAGE
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                postImage,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 14),

            /// ACTION BUTTONS
            Row(
              children: [
                Image.asset("assets/icons/heart.png", height: 26),
                const SizedBox(width: 16),
                Image.asset("assets/icons/comment.png", height: 26),
                const SizedBox(width: 16),
                Image.asset("assets/icons/send.png", height: 26),
                const Spacer(),
                Image.asset("assets/icons/bookmark.png", height: 26),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
