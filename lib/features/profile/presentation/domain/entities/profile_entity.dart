
import '../../../../auth/domain/entities/user_entity.dart';

class ProfileEntity extends UserEntity {
  final String name;
  final String userName;
  final String website;
  final String bio;
  final String phone;
  final String gender;
  final String imageProfileUrl;
  final List<String> followers;
  final List<String> following;

  ProfileEntity({
    required super.uid,
    required super.password,
    required super.email,
    required this.name,
    required this.userName,
    required this.website,
    required this.bio,
    required this.phone,
    required this.gender,
    required this.imageProfileUrl,
    required this.followers,
    required this.following,
  });

  ProfileEntity copyWith({
    String? newName,
    String? newUserName,
    String? newWebsite,
    String? newBio,
    String? newPhone,
    String? newGender,
    String? newImageProfileUrl,
    List<String>? newFollowers,
    List<String>? newFollowing,
  }) {
    return ProfileEntity(
      uid: uid,
      password: password,
      email: email,
      name: newName ?? name,
      userName: newUserName ?? userName,
      website: newWebsite ?? website,
      bio: newBio ?? bio,
      phone: newPhone ?? phone,
      gender: newGender ?? gender,
      imageProfileUrl: newImageProfileUrl ?? imageProfileUrl,
      followers: newFollowers ?? followers,
      following: newFollowing ?? following,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'password': password,
      'email': email,
      'name': name,
      'userName': userName,
      'website': website,
      'bio': bio,
      'phone': phone,
      'gender': gender,
      'imageProfileUrl': imageProfileUrl,
      'followers': followers,
      'following': following,
    };
  }

  factory ProfileEntity.fromMap(Map<String, dynamic> map) {
    return ProfileEntity(
      uid: map['uid'],
      password: map['password'],
      email: map['email'],
      name: map['name'] ?? '',
      userName: map['userName'] ?? '',
      website: map['website'] ?? '',
      bio: map['bio'] ?? '',
      phone: map['phone'] ?? '',
      gender: map['gender'] ?? '',
      imageProfileUrl: map['imageProfileUrl'] ?? '',
      followers: List<String>.from(map['followers'] ?? []),
      following: List<String>.from(map['following'] ?? []),
    );
  }
}
