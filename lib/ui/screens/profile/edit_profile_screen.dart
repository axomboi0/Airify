import 'package:flutter/material.dart';
import 'gender_select_sheet.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController bioCtrl = TextEditingController();
  String gender = "He / Him";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B0B0F),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title:
        const Text("Edit Profile", style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Bio", style: TextStyle(color: Colors.white70)),
            const SizedBox(height: 8),

            // BIO FIELD
            TextField(
              controller: bioCtrl,
              maxLines: 3,
              maxLength: 150,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white.withOpacity(0.06),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                counterStyle: const TextStyle(color: Colors.white54),
              ),
            ),

            const SizedBox(height: 20),

            const Text("Gender", style: TextStyle(color: Colors.white70)),
            const SizedBox(height: 8),

            // GENDER FIELD
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  backgroundColor: Colors.transparent,
                  context: context,
                  builder: (_) => GenderSelectSheet(
                    onSelect: (value) {
                      setState(() => gender = value);
                    },
                  ),
                );
              },
              child: Container(
                padding:
                const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.06),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(gender,
                        style: const TextStyle(color: Colors.white)),
                    const Icon(Icons.arrow_forward_ios,
                        color: Colors.white54, size: 16),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
