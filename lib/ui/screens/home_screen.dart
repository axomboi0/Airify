import 'package:flutter/material.dart';
import '../widgets/story_bubble.dart';
import '../widgets/feed_card.dart';
import '../widgets/common/create_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      removeTop: true,
      context: context,
      child: ListView(
        padding: EdgeInsets.zero,
        physics: const BouncingScrollPhysics(),
        children: [
          // ======================================
          // TOP INSTAGRAM HEADER
          // ======================================
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 26, 16, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CreateButton(size: 26),
                const Text(
                  "Airify",
                  style: TextStyle(
                    fontFamily: "Billabong",
                    fontSize: 42,
                    color: Colors.white,
                    height: 1.2,
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Image.asset(
                    "assets/icons/heart.png",
                    height: 28,
                  ),
                ),
              ],
            ),
          ),

          // ======================================
          // STORIES
          // ======================================
          SizedBox(
            height: 110,
            child: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: ListView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                children: const [
                  StoryBubble(
                      image: "assets/images/1994894.jpg", username: "User 0"),
                  StoryBubble(
                      image: "assets/images/0fed79bdb236c10695caad114ef2ef9f.jpg",
                      username: "User 1"),
                  StoryBubble(
                      image: "assets/images/2d3398f0589b88e3f3cea89e22308275.jpg",
                      username: "User 2"),
                  StoryBubble(
                      image: "assets/images/1994894.jpg", username: "User 3"),
                  StoryBubble(
                      image: "assets/images/0fed79bdb236c10695caad114ef2ef9f.jpg",
                      username: "User 4"),
                ],
              ),
            ),
          ),

          const SizedBox(height: 18),

          // ======================================
          // FEED POSTS
          // ======================================
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: FeedCard(
              username: "nature",
              location: "Seceda, Italy",
              avatarImage: "assets/images/1994894.jpg",
              postImage:
              "assets/images/631c139d4909d4ce164022f4c387a38a.jpg",
            ),
          ),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: FeedCard(
              username: "architecture",
              location: "Tokyo, Japan",
              avatarImage: "assets/images/0fed79bdb236c10695caad114ef2ef9f.jpg",
              postImage:
              "assets/images/8bf200fb976de182282e9b583633cd4b.jpg",
            ),
          ),
        ],
      ),
    );
  }
}
