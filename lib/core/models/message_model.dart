class MessageModel {
  final String senderId;
  final String text;
  final DateTime timestamp;
  final bool isMe;

  MessageModel({
    required this.senderId,
    required this.text,
    required this.timestamp,
    required this.isMe,
  });
}
