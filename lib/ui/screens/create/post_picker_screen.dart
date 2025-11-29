import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:project/core/utils/permissions.dart'; // FIXED IMPORT

class PostPickerScreen extends StatefulWidget {
  const PostPickerScreen({super.key}); // FIXED CONSTRUCTOR

  @override
  State<PostPickerScreen> createState() => _PostPickerScreenState();
}

class _PostPickerScreenState extends State<PostPickerScreen> {
  final ImagePicker picker = ImagePicker();
  List<XFile> images = [];

  @override
  void initState() {
    super.initState();
    requestAndLoad();
  }

  Future<void> requestAndLoad() async {
    bool allowed = await AppPermissions.requestPhotosPermission();

    if (!allowed) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Permission required to access photos")),
      );
      return;
    }

    loadGallery();
  }

  Future<void> loadGallery() async {
    final result = await picker.pickMultiImage();
    if (result.isNotEmpty) {
      setState(() => images = result);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Post"),
        backgroundColor: Colors.black,
      ),
      body: images.isEmpty
          ? const Center(child: Text("No images", style: TextStyle(color: Colors.white)))
          : GridView.builder(
        padding: const EdgeInsets.all(2),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 2,
          mainAxisSpacing: 2,
        ),
        itemCount: images.length,
        itemBuilder: (context, i) {
          return Image.file(File(images[i].path), fit: BoxFit.cover);
        },
      ),
    );
  }
}
