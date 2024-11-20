import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  // search users
  searchUsersbyUserName(String userName) async {
    try {
      final userSnapshot = await firestore
          .collection('users')
          .where('userName', isGreaterThanOrEqualTo: userName)
          .get();

      emit(SearchSuccess(users: userSnapshot.docs));
    } catch (e) {
      emit(SearchFailure(errorMessage: e.toString()));
    }
  }

  // get posts
  getPosts(String uId) async {
    try {
      final postsSnapshot = await firestore
          .collection('posts')
          .where('uId', isEqualTo: uId)
          .get();

      emit(PostsSuccess(posts: postsSnapshot.docs));
    } catch (e) {
      emit(SearchFailure(errorMessage: e.toString()));
    }
  }
}
