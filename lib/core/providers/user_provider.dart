import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../core/models/user_model.dart';

class UserProvider extends ChangeNotifier {
  UserModel currentUser = UserModel(
    uid: "me",
    username: "airify_user",
    bio: "Living in the moment ✨",
    profileImageUrl: "assets/images/1994894.jpg",
  );

  final _picker = ImagePicker();

  // ------ CHANGE PROFILE PICTURE ------
  Future<void> changeProfilePicture() async {
    final picked = await _picker.pickImage(source: ImageSource.gallery);
    if (picked == null) return;

    currentUser = currentUser.copyWith(profileImageUrl: picked.path);
    notifyListeners();
  }

  // ------ UPDATE USERNAME ------
  void updateUsername(String newName) {
    currentUser = currentUser.copyWith(username: newName);
    notifyListeners();
  }

  void updateProfile({required String name, required String bio}) {
    currentUser = currentUser.copyWith(
      username: name,
      bio: bio,
    );
    notifyListeners();
  }

  // ------ UPDATE BIO ------
  void updateBio(String newBio) {
    currentUser = currentUser.copyWith(bio: newBio);
    notifyListeners();
  }
}
