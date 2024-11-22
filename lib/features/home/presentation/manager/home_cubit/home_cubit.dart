import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  getPosts(String uId) {
    try {
      firestore
          .collection('posts')
          .where('uId', isEqualTo: uId)
          .snapshots()
          .listen((snapshot) {
        if (snapshot.docs.isEmpty) {
          emit(HomeNoPosts());
        } else {
          final posts = snapshot.docs
              .map((doc) => doc.data() as Map<String, dynamic>)
              .toList();
          emit(HomePostsSuccess(posts));
        }
      });
    } catch (error) {
      emit(HomeFailure(error.toString()));
    }
  }

  Future<void> likePost(
    String postId,
    String uId,
    List likes,
  ) async {
    try {
      if(likes.contains(uId)) {
        await firestore.collection('posts').doc(postId).update({
        'likes': FieldValue.arrayRemove([uId]),
      });
      } else {
        await firestore.collection('posts').doc(postId).update({
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
