import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:instagram/core/services/firestore_service.dart';
import 'package:meta/meta.dart';

part 'post_state.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit() : super(PostInitial());

  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> addPost({
    required String description,
    required Uint8List img,
    required String uid,
    required String userName,
    required String profileImage,
  }) async {
    String err = 'some error occured';
    try {
      await FirestoreService().uploadPost(
        description,
        img,
        uid,
        userName,
        profileImage,
      );
      err = 'Posted Success';
      emit(AddPostSuccess());
    } catch (e) {
      err = e.toString();
      emit(AddPostFailure());
    }
    return err;
  }

  // delete the post
  Future<void> deletePost(String postId) async {
    try {
      await _firestore.collection('posts').doc(postId).delete();
      emit(DeletePostSuccess());
    } catch (e) {
      emit(DeletePostFailure());
      print(e.toString());
    }
  }
}
