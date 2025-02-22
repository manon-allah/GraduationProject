import 'package:cloud_firestore/cloud_firestore.dart';

class StoryEntity {
  final String id;
  final String userId;
  final String userName;
  final String name;
  final String profileImage;
  final List<String>? storyImageUrl;
  final DateTime datePublished;

  StoryEntity({
    required this.id,
    required this.userId,
    required this.userName,
    required this.name,
    required this.profileImage,
    this.storyImageUrl,
    required this.datePublished,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'userName': userName,
      'name': name,
      'storyImageUrl': storyImageUrl,
      'datePublished': datePublished,
      'profileImageUrl': profileImage,
    };
  }

  factory StoryEntity.fromMap(Map<String, dynamic> map) {
    return StoryEntity(
      id: map['id'],
      userId: map['userId'],
      name: map['name'],
      userName: map['userName'],
      profileImage: map['profileImage'] ?? '',
      storyImageUrl: List<String>.from(map['storyImageUrl']),
      datePublished:
          (map['datePublished'] as Timestamp?)?.toDate() ?? DateTime.now(),
    );
  }
}
