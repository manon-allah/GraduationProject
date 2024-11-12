import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:instagram/core/services/firestore_service.dart';
import 'package:meta/meta.dart';

part 'add_post_state.dart';

class AddPostCubit extends Cubit<AddPostState> {
  AddPostCubit() : super(AddPostInitial());

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
}
