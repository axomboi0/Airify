import 'package:flutter/foundation.dart';

@immutable
class PostModel {
  final String postId;
  final String userId; // ⭐ FIX: Added missing field
  final String mediaUrl;
  final String caption;
  final int likes;
  final DateTime timestamp;

  const PostModel({
    required this.postId,
    required this.userId, // ⭐ FIX: Added to constructor
    required this.mediaUrl,
    required this.caption,
    required this.likes,
    required this.timestamp,
  });
}
