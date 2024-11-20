part of 'profile_cubit.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class UserDataSuccess extends ProfileState {
  final Map<String, dynamic> userData;
  final int followers;
  final int following;
  final bool isFollowing;

  UserDataSuccess({
    required this.userData,
    required this.followers,
    required this.following,
    required this.isFollowing,
  });
}

final class PostLengthSuccess extends ProfileState {
  final int postLength;

  PostLengthSuccess({
    required this.postLength,
  });
}

final class ProfileFailure extends ProfileState {
  final String message;
  ProfileFailure({
    required this.message,
  });
}
