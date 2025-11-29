import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'explore_detail_screen.dart';
import 'explore_pill_bar.dart';
import 'reels_player_screen.dart';
import '../widgets/video_tile.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  int selected = 0;

  // ⭐ 1. YOUR GUARD FLAG
  bool isNavigating = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B0B0F),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                height: 45,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.08),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Row(
                  children: const [
                    SizedBox(width: 12),
                    Icon(Icons.search, color: Colors.white54, size: 22),
                    SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: "Search",
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                            color: Colors.white60,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 12),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),
            ExplorePillBar(
              selected: selected,
              // ⭐ 2. YOUR NAVIGATION LOGIC APPLIED HERE
              onChanged: (i) {
                if (i == 1) {
                  if (isNavigating) return; // Prevent double push
                  isNavigating = true;

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const ReelsPlayerScreen(initialIndex: 0),
                    ),
                  ).then((_) {
                    isNavigating = false; // Unlock after returning
                  });
                  return;
                }
                setState(() => selected = i);
              },
            ),
            const SizedBox(height: 12),
            Expanded(child: _buildPinterestGrid()),
          ],
        ),
      ),
    );
  }

  Widget _buildPinterestGrid() {
    return MasonryGridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      physics: const BouncingScrollPhysics(),
      itemCount: exploreItems.length,
      itemBuilder: (context, index) {
        final item = exploreItems[index];

        if (item['type'] == 'image') {
          return GestureDetector(
            onTap: () {
              if (isNavigating) return;
              isNavigating = true;
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => ExploreDetailScreen(image: item['src']))
              ).then((_) => isNavigating = false);
            },
            child: Hero(
              tag: item['src'],
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(item['src'], fit: BoxFit.cover),
              ),
            ),
          );
        }

        return GestureDetector(
          onTap: () {
            if (isNavigating) return;
            isNavigating = true;
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => ReelsPlayerScreen(initialIndex: item['reelIndex']))
            ).then((_) => isNavigating = false);
          },
          child: VideoTile(
            videoPath: item['src'],
            reelIndex: item['reelIndex'],
          ),
        );
      },
    );
  }
}

final List<Map<String, dynamic>> exploreItems = [
  {"type": "image", "src": "assets/images/1994894.jpg"},
  {"type": "image", "src": "assets/images/0fed79bdb236c10695caad114ef2ef9f.jpg"},
  {"type": "image", "src": "assets/images/2d3398f0589b88e3f3cea89e22308275.jpg"},
  {"type": "image", "src": "assets/images/8bf200fb976de182282e9b583633cd4b.jpg"},
  {"type": "video", "src": "assets/reels/reel1.mp4", "reelIndex": 0},
  {"type": "image", "src": "assets/images/631c139d4909d4ce164022f4c387a38a.jpg"},
  {"type": "video", "src": "assets/reels/reel2.mp4", "reelIndex": 1},
  {"type": "image", "src": "assets/images/1994894.jpg"},
];
