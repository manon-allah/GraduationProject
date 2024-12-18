part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeSuccess extends HomeState {
  final List<PostEntity> posts;
  final List<String> likes;
  final ProfileEntity following;

  HomeSuccess(
    this.likes,
    this.following,
    this.posts,
  );
}

final class HomeError extends HomeState {
  final String message;

  HomeError(this.message);
}
