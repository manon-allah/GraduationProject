import 'package:cloud_firestore/cloud_firestore.dart';

class PostEntity {
  final String id;
  final String userId;
  final String description;
  final String profileImageUrl;
  final String bio;
  final String userName;
  final List<String>? postImageUrl;
  final DateTime datePublished;
  final List<String> likes;

  PostEntity({
    required this.id,
    required this.userId,
    required this.description,
    required this.userName,
    required this.postImageUrl,
    required this.datePublished,
    required this.profileImageUrl,
    required this.bio,
    required this.likes,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'description': description,
      'userName': userName,
      'postImageUrl': postImageUrl,
      'datePublished': datePublished,
      'profileImageUrl': profileImageUrl,
      'bio': bio,
      'likes': likes,
    };
  }

  factory PostEntity.fromMap(Map<String, dynamic> map) {
    return PostEntity(
      id: map['id'],
      userId: map['userId'],
      description: map['description'],
      userName: map['userName'],
      bio: map['bio'],
      profileImageUrl: map['profileImageUrl'] ?? '',
      postImageUrl: List<String>.from(map['postImageUrl']),
      datePublished: (map['datePublished'] as Timestamp?)?.toDate() ?? DateTime.now(),
      likes: List<String>.from(map['likes'] ?? []),
    );
  }
}
