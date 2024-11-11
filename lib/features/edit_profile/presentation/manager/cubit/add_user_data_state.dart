part of 'add_user_data_cubit.dart';

@immutable
sealed class AddUserDataState {}

final class AddUserDataInitial extends AddUserDataState {}
final class AddUserDataSuccess extends AddUserDataState {}
final class AddUserDataFailure extends AddUserDataState {}
