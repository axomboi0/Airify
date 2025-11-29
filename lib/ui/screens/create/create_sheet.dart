import 'package:flutter/material.dart';

class CreateSheet extends StatelessWidget {
  const CreateSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 22),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Create",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 26),

            // POST
            _item(
              context,
              icon: Icons.grid_on_rounded,
              text: "Post",
              route: "/create_post",
            ),

            _item(
              context,
              icon: Icons.camera_alt_rounded,
              text: "Story",
              route: "/create_story",
            ),

            _item(
              context,
              icon: Icons.slow_motion_video_rounded,
              text: "Reel",
              route: "/create_reel",
            ),

            _item(
              context,
              icon: Icons.live_tv_rounded,
              text: "Live",
              route: "/create_live",
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _item(BuildContext context,
      {required IconData icon, required String text, required String route}) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon, size: 30, color: Colors.white),
      title: Text(text, style: const TextStyle(fontSize: 18)),
      onTap: () {
        Navigator.pop(context);
        Navigator.pushNamed(context, route);
      },
    );
  }
}
