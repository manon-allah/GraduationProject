part of 'switch_cubit.dart';

@immutable
sealed class SwitchState {}

final class SwitchInitial extends SwitchState {}
final class SwitchLightTheme extends SwitchState {}
final class SwitchDarkTheme extends SwitchState {}
