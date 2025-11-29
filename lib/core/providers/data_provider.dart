import 'package:flutter/material.dart';
import '../models/user_model.dart';
import '../models/post_model.dart';
import '../models/story_model.dart';
import '../models/chat_model.dart';
import '../models/message_model.dart';
import '../utils.dart';

class DataProvider extends ChangeNotifier {

  // ================================
  // USERS
  // ================================
  final List<UserModel> users = [
    UserModel(
      uid: "1",
      username: "nature",
      bio: "Lover of mountains ▲",
      profileImageUrl: "assets/images/1994894.jpg",
    ),
    UserModel(
      uid: "2",
      username: "architecture",
      bio: "Tokyo streets & vibes 🏙️",
      profileImageUrl: "assets/images/0fed79bdb236c10695caad114ef2ef9f.jpg",
    ),
  ];

  // ================================
  // POSTS
  // ================================
  final List<PostModel> posts = [
    PostModel(
      postId: Utils.randomId(),
      mediaUrl: "assets/images/631c139d4909d4ce164022f4c387a38a.jpg",
      caption: "Beautiful day at Seceda 🌄",
      likes: 5200,
      timestamp: DateTime.now().subtract(const Duration(hours: 2)),
      userId: "1",
    ),
    PostModel(
      postId: Utils.randomId(),
      mediaUrl: "assets/images/8bf200fb976de182282e9b583633cd4b.jpg",
      caption: "Tokyo aesthetics 💙",
      likes: 2500,
      timestamp: DateTime.now().subtract(const Duration(days: 1)),
      userId: "2",
    ),
  ];

  // ================================
  // STORIES
  // ================================
  final List<StoryModel> stories = [
    StoryModel(
      storyId: Utils.randomId(),
      mediaUrl: "assets/images/1994894.jpg",
      userId: "1",
      isViewed: false,
      timestamp: DateTime.now().subtract(const Duration(hours: 1)),
    ),
    StoryModel(
      storyId: Utils.randomId(),
      mediaUrl: "assets/images/0fed79bdb236c10695caad114ef2ef9f.jpg",
      userId: "2",
      isViewed: true,
      timestamp: DateTime.now().subtract(const Duration(hours: 3)),
    ),
  ];

  // ================================
  // CHATS
  // ================================
  final List<ChatModel> chats = [
    ChatModel(
      chatId: "chat1",
      userId: "1",
      lastMessage: "Hey, how are you?",
      lastUpdated: DateTime.now().subtract(const Duration(minutes: 10)),
      messages: [
        MessageModel(
          senderId: "1",
          text: "Hey, how are you?",
          timestamp: DateTime.now().subtract(const Duration(minutes: 20)),
          isMe: false,
        ),
        MessageModel(
          senderId: "me",
          text: "I'm good bro!",
          timestamp: DateTime.now().subtract(const Duration(minutes: 10)),
          isMe: true,
        ),
      ],
    ),
  ];
}
