part of 'post_cubit.dart';

@immutable
sealed class PostState {}

final class PostInitial extends PostState {}

final class PostsLoading extends PostState {}

final class PostsUploading extends PostState {}

final class PostsSuccess extends PostState {
  final List<PostEntity> posts;
  PostsSuccess(this.posts);
}

final class PostsError extends PostState {
  final String message;
  PostsError(this.message);
}
