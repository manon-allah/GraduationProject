part of 'get_data_cubit.dart';

@immutable
sealed class GetDataState {}

final class GetDataInitial extends GetDataState {}
final class GetDataSuccess extends GetDataState {}
final class GetDataFailure extends GetDataState {}