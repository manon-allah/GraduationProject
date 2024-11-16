part of 'post_cubit.dart';

@immutable
sealed class PostState {}

final class PostInitial extends PostState {}

final class AddPostSuccess extends PostState {}

final class AddPostFailure extends PostState {}

final class DeletePostSuccess extends PostState {}

final class DeletePostFailure extends PostState {}
