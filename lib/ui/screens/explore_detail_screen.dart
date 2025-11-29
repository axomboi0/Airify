import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ExploreDetailScreen extends StatefulWidget {
  final String image;

  const ExploreDetailScreen({super.key, required this.image});

  @override
  State<ExploreDetailScreen> createState() => _ExploreDetailScreenState();
}

class _ExploreDetailScreenState extends State<ExploreDetailScreen> {
  bool saved = false;
  double toolbarOpacity = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B0B0F),

      body: NotificationListener<ScrollNotification>(
        onNotification: (scroll) {
          final offset = scroll.metrics.pixels;
          setState(() {
            toolbarOpacity = (1 - (offset / 180)).clamp(0.0, 1.0);
          });
          return true;
        },

        child: Stack(
          children: [
            CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      const SizedBox(height: 20),  // ⭐ TOP PADDING LIKE FEEDCARD

                      // ============================
                      // BIG HEADER IMAGE
                      // ============================
                      Hero(
                        tag: widget.image,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(26),
                          child: Image.asset(
                            widget.image,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                      const SizedBox(height: 14),

                      // ============================
                      // ACTIONS UNDER POST
                      // ============================
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          children: [
                            _iconButton(Icons.favorite_border, () {}),
                            const SizedBox(width: 22),
                            _iconButton(Icons.chat_bubble_outline, () {
                              _openComments();
                            }),
                            const SizedBox(width: 22),
                            _iconButton(Icons.share_outlined, () {}),
                            const Spacer(),
                            _iconButton(Icons.more_horiz, () {
                              _openBottomActions();
                            }),
                          ],
                        ),
                      ),

                      const SizedBox(height: 25),

                      // ============================
                      // TITLE
                      // ============================
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          "Related Posts",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),

                      const SizedBox(height: 16),
                    ],
                  ),
                ),

                // ============================
                // RELATED POSTS GRID
                // ============================
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  sliver: SliverMasonryGrid.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childCount: relatedImages.length,
                    itemBuilder: (context, index) {
                      final img = relatedImages[index];

                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) =>
                                  ExploreDetailScreen(image: img),
                            ),
                          );
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.asset(
                            img,
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  ),
                ),

                const SliverToBoxAdapter(
                  child: SizedBox(height: 80),
                ),
              ],
            ),

            // ============================
            // TOP FADE TOOLBAR
            // ============================
            AnimatedOpacity(
              opacity: toolbarOpacity,
              duration: const Duration(milliseconds: 150),
              child: Container(
                height: 90,
                padding: const EdgeInsets.only(left: 16, right: 16, top: 40),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.black54, Colors.transparent],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(Icons.arrow_back_ios_new,
                          color: Colors.white, size: 24),
                    ),

                    GestureDetector(
                      onTap: () => setState(() => saved = !saved),
                      child: Icon(
                        saved ? Icons.bookmark : Icons.bookmark_border,
                        color: Colors.white,
                        size: 28,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _iconButton(IconData icon, Function() onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Icon(icon, color: Colors.white, size: 26),
    );
  }

  void _openComments() {
    showModalBottomSheet(
      backgroundColor: const Color(0xFF111111),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(22)),
      ),
      context: context,
      builder: (_) {
        return SizedBox(
          height: 350,
          child: Column(
            children: const [
              SizedBox(height: 12),
              Text("Comments", style: TextStyle(color: Colors.white, fontSize: 18)),
              Divider(color: Colors.white24),
              Expanded(
                child: Center(
                  child: Text(
                    "Comments coming soon...",
                    style: TextStyle(color: Colors.white54),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  void _openBottomActions() {
    showModalBottomSheet(
      backgroundColor: const Color(0xFF111111),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(22)),
      ),
      context: context,
      builder: (_) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.download, color: Colors.white),
              title: const Text("Download", style: TextStyle(color: Colors.white)),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.link, color: Colors.white),
              title: const Text("Copy Link", style: TextStyle(color: Colors.white)),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.flag, color: Colors.white),
              title: const Text("Report", style: TextStyle(color: Colors.white)),
              onTap: () {},
            ),
          ],
        );
      },
    );
  }
}

final List<String> relatedImages = [
  "assets/images/1994894.jpg",
  "assets/images/2d3398f0589b88e3f3cea89e22308275.jpg",
  "assets/images/631c139d4909d4ce164022f4c387a38a.jpg",
  "assets/images/8bf200fb976de182282e9b583633cd4b.jpg",
  "assets/images/0fed79bdb236c10695caad114ef2ef9f.jpg",
  "assets/images/1994894.jpg",
];
