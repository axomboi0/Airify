import 'package:flutter/material.dart';

// your reels list
import '../../core/constants.dart';

// NEW modular reel widget
import '../widgets/reels/reel_video_widget.dart';

class ReelsPlayerScreen extends StatefulWidget {
  final int initialIndex;
  const ReelsPlayerScreen({super.key, required this.initialIndex});

  @override
  State<ReelsPlayerScreen> createState() => _ReelsPlayerScreenState();
}

class _ReelsPlayerScreenState extends State<ReelsPlayerScreen> {
  late PageController _pageController;
  int _current = 0;

  @override
  void initState() {
    super.initState();

    _current = widget.initialIndex;

    // ⭐ FIX: `keepPage: false` prevents the jumping bug on navigation.
    _pageController = PageController(
      initialPage: _current,
      keepPage: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // PAGEVIEW
          PageView.builder(
            controller: _pageController,
            scrollDirection: Axis.vertical,
            itemCount: mockReels.length,
            onPageChanged: (i) {
              setState(() => _current = i);
            },
            itemBuilder: (context, index) {
              return ReelVideoWidget(
                key: ValueKey(mockReels[index].id),
                reel: mockReels[index],
                isActive: index == _current,
              );
            },
          ),
        ],
      ),
    );
  }
}
