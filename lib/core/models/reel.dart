// lib/core/models/reel.dart

enum ReelSourceType {
  asset,
  network,
  file,
}

class Reel {
  final String id;
  final String source;
  final ReelSourceType sourceType;

  final String username;
  final String caption;
  final String profileImage;
  final String userId;

  final int likes;
  final int comments;

  // NEW FIELDS
  final bool isLiked;
  final String audioInfo;

  Reel({
    required this.id,
    required this.source,
    required this.sourceType,
    required this.username,
    required this.caption,
    required this.profileImage,
    required this.userId,
    required this.likes,
    required this.comments,
    this.isLiked = false,
    this.audioInfo = "",
  });
}
