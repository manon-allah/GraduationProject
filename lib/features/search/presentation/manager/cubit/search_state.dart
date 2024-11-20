part of 'search_cubit.dart';

@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {}

final class SearchSuccess extends SearchState {
  final List<QueryDocumentSnapshot> users;

  SearchSuccess({
    required this.users,
  });
}

final class PostsSuccess extends SearchState {
  final List<QueryDocumentSnapshot> posts;
  PostsSuccess({
    required this.posts,
  });
}

final class SearchFailure extends SearchState {
  final String errorMessage;
  SearchFailure({
    required this.errorMessage,
  });
}
