import 'package:cloud_firestore/cloud_firestore.dart';

class PostModel {
  final String uId;
  final String description;
  final String userName;
  final String postId;
  final datePublished;
  final String postUrl;
  final String profileImage;
  final likes;

  PostModel({
    required this.uId,
    required this.description,
    required this.userName,
    required this.postId,
    required this.datePublished,
    required this.postUrl,
    required this.profileImage,
    required this.likes,
  });
  Map<String, dynamic> toMap() {
    return {
      'uId': uId,
      'userName': userName,
      'description': description,
      'postId': postId,
      'datePublished': datePublished,
      'postUrl': postUrl,
      'profileImage': profileImage,
      'likes': likes,
    };
  }

  //
  static PostModel fromSnapshot(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return PostModel(
      uId: snapshot['uId'],
      userName: snapshot['userName'],
      description: snapshot['description'],
      postId: snapshot['postId'],
      datePublished: snapshot['datePublished'],
      postUrl: snapshot['postUrl'],
      profileImage: snapshot['profileImage'],
      likes: snapshot['likes'],
    );
  }
}
