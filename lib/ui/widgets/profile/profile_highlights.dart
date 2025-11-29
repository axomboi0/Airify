import 'package:flutter/material.dart';
import '../../../ui/screens/profile/highlight_manage_screen.dart';

class ProfileHighlights extends StatelessWidget {
  const ProfileHighlights({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> highlights = [
      'assets/highlights/1.jpg',
      'assets/highlights/2.jpg',
      'assets/highlights/3.jpg',
    ];

    // ⭐ FIX: This widget must return a Sliver, not a regular widget.
    // The ListView is now the child of the SliverToBoxAdapter.
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 110,
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          scrollDirection: Axis.horizontal,
          itemCount: highlights.length + 1,
          itemBuilder: (context, index) {
            // First item is the 'New' button
            if (index == 0) {
              return GestureDetector(
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const HighlightManageScreen())),
                child: SizedBox(
                  width: 72,
                  child: Column(
                    children: [
                      Container(
                        height: 72, 
                        width: 72,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle, 
                          color: Colors.white12, 
                          border: Border.all(color: Colors.white24)
                        ),
                        child: const Center(child: Icon(Icons.add, color: Colors.white, size: 28)),
                      ),
                      const SizedBox(height: 6),
                      const Text('New', style: TextStyle(color: Colors.white70)),
                    ],
                  ),
                ),
              );
            }

            // The rest are the highlight circles
            final imagePath = highlights[index - 1];
            return Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Column(
                children: [
                  Container(
                    height: 72, 
                    width: 72,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle, 
                      border: Border.all(color: Colors.white24), 
                      image: DecorationImage(image: AssetImage(imagePath), fit: BoxFit.cover)
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text('Highlight', style: TextStyle(color: Colors.white70)),
                ]
              ),
            );
          },
        ),
      ),
    );
  }
}
