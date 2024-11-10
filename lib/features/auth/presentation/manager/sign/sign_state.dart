part of 'sign_cubit.dart';

@immutable
sealed class SignState {}

final class SignInitial extends SignState {}

final class SignupSuccess extends SignState {}

final class SignupFailure extends SignState {}

final class LoginSuccess extends SignState {}

final class LoginFailure extends SignState {}
