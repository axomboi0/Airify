import 'package:flutter/material.dart';

class ReelCaption extends StatelessWidget {
  final String username;
  final String caption;
  final String profileImage;

  const ReelCaption({
    Key? key,
    required this.username,
    required this.caption,
    required this.profileImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Positioned(
      left: 16,
      right: 120, 
      bottom: 80, 
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(radius: 18, backgroundImage: AssetImage(profileImage)),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  username,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            caption,
            style: const TextStyle(color: Colors.white70, fontSize: 13),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
