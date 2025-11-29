import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  final String username;
  final String location;
  final String image;

  const PostCard({
    super.key,
    required this.username,
    required this.location,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: const CircleAvatar(
              backgroundImage: AssetImage("assets/images/897b278f72e707da9116150064daa78c.jpg"),
            ),
            title: Text(username, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            subtitle: Text(location, style: const TextStyle(color: Colors.grey)),
            trailing: const Icon(Icons.more_horiz, color: Colors.white),
          ),
          Image.asset(image),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
            child: Row(
              children: const [
                Icon(Icons.favorite_border, color: Colors.white, size: 28),
                SizedBox(width: 20),
                Icon(Icons.mode_comment_outlined, color: Colors.white, size: 28),
                SizedBox(width: 20),
                Icon(Icons.send_outlined, color: Colors.white, size: 28),
                Spacer(),
                Icon(Icons.bookmark_border, color: Colors.white, size: 28),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
