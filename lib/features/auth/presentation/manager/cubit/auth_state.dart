part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class Authenticated extends AuthState {
  final UserEntity userEntity;
  Authenticated(this.userEntity);
}

final class UnAuthenticated extends AuthState {}

final class AuthError extends AuthState {
  final String message;
  AuthError(this.message);
}
