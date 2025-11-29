import 'package:flutter/material.dart';
import 'dart:ui';

class ChatScreen extends StatefulWidget {
  final String username;

  const ChatScreen({super.key, required this.username});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();

  final List<Map<String, dynamic>> messages = [
    {"me": false, "msg": "Hey, kya haal chaal?"},
    {"me": true, "msg": "Bas bhai, app bana raha hu 👀"},
    {"me": false, "msg": "UI to mast lag rahi! 😭"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B0B0F),
      body: SafeArea(
        child: Column(
          children: [
            _buildTopBar(),

            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  return _buildBubble(messages[index]);
                },
              ),
            ),

            _buildInputBar(),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }

  // ======================= TOP BAR =======================
  Widget _buildTopBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Icon(Icons.arrow_back, color: Colors.white, size: 26),
          ),
          const SizedBox(width: 14),

          Text(
            widget.username,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  // ======================= MESSAGE BUBBLE =======================
  Widget _buildBubble(Map msg) {
    final isMe = msg["me"];

    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        constraints: const BoxConstraints(maxWidth: 260),
        decoration: BoxDecoration(
          color: isMe
              ? Colors.blueAccent.withOpacity(0.8)
              : Colors.white.withOpacity(0.09),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          msg["msg"],
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }

  // ======================= INPUT BAR =======================
  Widget _buildInputBar() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      height: 55,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.08),
        borderRadius: BorderRadius.circular(22),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                hintText: "Type a message...",
                hintStyle: TextStyle(color: Colors.white54),
                border: InputBorder.none,
              ),
            ),
          ),

          GestureDetector(
            onTap: () {
              if (_controller.text.trim().isEmpty) return;

              setState(() {
                messages.add({"me": true, "msg": _controller.text});
              });

              _controller.clear();
            },
            child: const Icon(Icons.send, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
