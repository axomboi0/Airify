import 'package:flutter/material.dart';
import '../../screens/profile/edit_profile_screen.dart';

class ProfileActionButtons extends StatelessWidget {
  const ProfileActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(children: [
        Expanded(
          child: GestureDetector(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const EditProfileScreen())),
            child: Container(
              height: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(color: Colors.white.withOpacity(0.04), borderRadius: BorderRadius.circular(8), border: Border.all(color: Colors.white12)),
              child: const Text('Edit profile', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
            ),
          ),
        ),
        const SizedBox(width: 8),
        GestureDetector(
          onTap: () {
            // share sheet
            showModalBottomSheet(
              context: context,
              backgroundColor: const Color(0xFF111111),
              builder: (_) => SizedBox(height: 140, child: Column(children: const [
                ListTile(title: Text('Share profile link', style: TextStyle(color: Colors.white))),
                ListTile(title: Text('Copy link', style: TextStyle(color: Colors.white))),
              ])),
            );
          },
          child: Container(
            height: 40,
            width: 48,
            decoration: BoxDecoration(color: Colors.white.withOpacity(0.04), borderRadius: BorderRadius.circular(8), border: Border.all(color: Colors.white12)),
            child: const Icon(Icons.send, color: Colors.white, size: 20),
          ),
        ),
        const SizedBox(width: 8),
        GestureDetector(
          onTap: () {
            // optional contact button
          },
          child: Container(
            height: 40,
            width: 48,
            decoration: BoxDecoration(color: Colors.white.withOpacity(0.04), borderRadius: BorderRadius.circular(8), border: Border.all(color: Colors.white12)),
            child: const Icon(Icons.more_horiz, color: Colors.white, size: 20),
          ),
        ),
      ]),
    );
  }
}
