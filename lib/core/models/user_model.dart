class UserModel {
  final String uid;
  final String username;
  final String bio;
  final String profileImageUrl;

  UserModel({
    required this.uid,
    required this.username,
    required this.bio,
    required this.profileImageUrl,
  });

  UserModel copyWith({
    String? username,
    String? bio,
    String? profileImageUrl,
  }) {
    return UserModel(
      uid: uid,
      username: username ?? this.username,
      bio: bio ?? this.bio,
      profileImageUrl: profileImageUrl ?? this.profileImageUrl,
    );
  }
}

