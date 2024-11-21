import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'like_state.dart';

class LikeCubit extends Cubit<LikeState> {
  LikeCubit() : super(LikeInitial());

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> likePost(
    String postId,
    String uId,
    List likes,
  ) async {
    try {
      if(likes.contains(uId)) {
        await _firestore.collection('posts').doc(postId).update({
        'likes': FieldValue.arrayRemove([uId]),
      });
      } else {
        await _firestore.collection('posts').doc(postId).update({
        'likes': FieldValue.arrayUnion([uId]),
      });
      }
      emit(LikeSuccess());
      
    } catch (e) {
      log(e.toString());
      emit(LikeFailure());
    }
  }
}
