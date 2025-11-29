// lib/core/models/chat_model.dart

import 'message_model.dart';

class ChatModel {
  final String chatId;
  final String userId;
  final String lastMessage;     // <-- add this
  final DateTime lastUpdated;
  final List<MessageModel> messages;

  const ChatModel({
    required this.chatId,
    required this.userId,
    required this.lastMessage,   // <-- required named param
    required this.lastUpdated,
    required this.messages,
  });
}
