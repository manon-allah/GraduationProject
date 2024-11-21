part of 'like_cubit.dart';

@immutable
sealed class LikeState {}

final class LikeInitial extends LikeState {}
final class LikeSuccess extends LikeState {}
final class LikeFailure extends LikeState {}
