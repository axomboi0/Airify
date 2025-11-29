import 'package:project/core/models/reel.dart';

final List<Reel> mockReels = [
  Reel(
    id: 'r1',
    source: "assets/reels/reel1.mp4",
    sourceType: ReelSourceType.asset,
    username: "airify_user",
    userId: "u1",
    profileImage: "assets/images/p1.jpg",
    caption: "Edited by @aeva.edits",
    likes: 168000,
    comments: 308,
    audioInfo: "Original audio — airify_user",
  ),

  Reel(
    id: 'r2',
    source: "https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4",
    sourceType: ReelSourceType.network,
    username: "traveler",
    userId: "u2",
    profileImage: "assets/images/p1.jpg",
    caption: "Roadtrip vibes 🌄",
    likes: 92000,
    comments: 152,
    audioInfo: "Original audio — traveler",
  ),

  Reel(
    id: 'r3',
    source: "assets/reels/reel2.mp4",
    sourceType: ReelSourceType.asset,
    username: "editor",
    userId: "u3",
    profileImage: "assets/images/p1.jpg",
    caption: "Smooth transitions 🔥",
    likes: 54000,
    comments: 220,
    audioInfo: "Original audio — editor",
  ),

  Reel(
    id: 'r4',
    source: "assets/reels/reel3.mp4",
    sourceType: ReelSourceType.asset,
    username: "lastxlip",
    userId: "u4",
    profileImage: "assets/images/p1.jpg",
    caption: "2007 vibes RICARDO MILOS BR🇧🇷🇺🇸",
    likes: 51300,
    comments: 578,
    audioInfo: "Funny audio — lastxlip",
  ),
];
