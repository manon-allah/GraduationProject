import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:instagram/core/services/storage_service.dart';
import 'package:uuid/uuid.dart';

import '../../features/add_post/data/models/post_model.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> uploadPost(
    String description,
    Uint8List file,
    String uid,
    String userName,
    String profileImage,

  ) async {
    String res = 'Some error occurred';
    try {
      String photoUrl =
          await StorageService().uploadImageToStorage('posts', file, true);
      String postId = const Uuid().v1();
      PostModel post = PostModel(
        description: description,
        uId: uid,
        userName: userName,
        likes: [],
        postId: postId,
        datePublished: DateTime.now(),
        postUrl: photoUrl,
        profileImage: profileImage,
      );
      _firestore.collection('posts').doc(postId).set(post.toMap());
      res = 'success';
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
