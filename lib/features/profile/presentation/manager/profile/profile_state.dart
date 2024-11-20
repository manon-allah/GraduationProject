part of 'profile_cubit.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}


final class UserDataSuccess extends ProfileState {
  final Map<String, dynamic> userData;
  final List<QueryDocumentSnapshot> posts;
  final int postLength;
  final int followers;
  final int following;
  final bool isFollowing;

  UserDataSuccess( {
    required this.userData,
    required this.followers,
    required this.following,
    required this.isFollowing,
    required this.postLength,
    required this.posts,
  });
}
final class ProfileFailure extends ProfileState {
  final String message;
  ProfileFailure({
    required this.message,
  });
}
