import 'package:flutter/material.dart';
import 'new_message_screen.dart';
import 'chat_screen.dart';

class ChatListScreen extends StatelessWidget {
  ChatListScreen({super.key});

  final List<String> names = [
    "Aarav Singh",
    "Pooja Sharma",
    "Chintu Gamer",
    "Munni Gupta",
    "Guddu Bhaiya",
    "Raju Kumar",
    "Shahrukh Biswas",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B0B0F),
      body: SafeArea(
        child: Column(
          children: [
            // ============================
            // TOP BAR
            // ============================
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Messages",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),

                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const NewMessageScreen(),
                        ),
                      );
                    },
                    child: Icon(
                      Icons.edit,
                      color: Colors.white.withValues(alpha: 0.85),
                      size: 24,
                    ),
                  ),
                ],
              ),
            ),

            // ============================
            // SEARCH BAR
            // ============================
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Container(
                height: 47,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(255, 255, 255, 0.08),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Row(
                  children: [
                    const SizedBox(width: 12),
                    const Icon(Icons.search, color: Colors.white54),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          hintText: "Search",
                          hintStyle: TextStyle(color: Colors.white54),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 14),

            // ============================
            // CHAT LIST
            // ============================
            Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: names.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ChatScreen(username: names[index]),
                        ),
                      );
                    },

                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 12,
                      ),
                      child: Row(
                        children: [
                          // AVATAR
                          Stack(
                            children: [
                              const CircleAvatar(
                                radius: 28,
                                backgroundImage:
                                AssetImage("assets/images/1994894.jpg"),
                              ),

                              Positioned(
                                bottom: 2,
                                right: 2,
                                child: Container(
                                  height: 12,
                                  width: 12,
                                  decoration: BoxDecoration(
                                    color: Colors.greenAccent,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 2,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(width: 14),

                          // NAME + STATUS
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  names[index],
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 3),
                                const Text(
                                  "Active now",
                                  style: TextStyle(
                                    color: Colors.white54,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const Icon(
                            Icons.chevron_right,
                            color: Colors.white24,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
