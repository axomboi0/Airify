import 'package:flutter/material.dart';
import '../models/chat_model.dart';
import '../models/message_model.dart';
import '../utils.dart';


class ChatProvider extends ChangeNotifier {
  // Map of chatID → List<messages>
  final Map<String, List<MessageModel>> chatMessages = {};

  // Initialize or fetch messages for a chat
  List<MessageModel> getMessages(String chatId) {
    chatMessages.putIfAbsent(chatId, () => [
      MessageModel(
        senderId: "1",
        text: "Hey!",
        timestamp: DateTime.now().subtract(const Duration(minutes: 10)),
        isMe: false,
      ),
      MessageModel(
        senderId: "me",
        text: "What’s up?",
        timestamp: DateTime.now().subtract(const Duration(minutes: 9)),
        isMe: true,
      ),
    ]);
    return chatMessages[chatId]!;
  }

  // Add a message
  void sendMessage(String chatId, String text) {
    final msg = MessageModel(
      senderId: "me",
      text: text,
      timestamp: DateTime.now(),
      isMe: true,
    );

    chatMessages.putIfAbsent(chatId, () => []);
    chatMessages[chatId]!.add(msg);

    notifyListeners();
  }
}
