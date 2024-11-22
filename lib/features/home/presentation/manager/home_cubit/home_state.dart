part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

class HomePostsSuccess extends HomeState {
  final List<Map<String, dynamic>> posts;
  HomePostsSuccess(this.posts);
}

class HomeNoPosts extends HomeState {}

class HomeFailure extends HomeState {
  final String message;
  HomeFailure(this.message);
}

final class LikeSuccess extends HomeState {}
final class LikeFailure extends HomeState {}