class StoryModel {
  final String storyId;
  final String mediaUrl;
  final String userId;
  final bool isViewed;
  final DateTime timestamp;

  StoryModel({
    required this.storyId,
    required this.mediaUrl,
    required this.userId,
    required this.isViewed,
    required this.timestamp,
  });
}
