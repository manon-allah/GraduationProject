import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../data/enums/theme_state.dart';

part 'switch_state.dart';

class SwitchCubit extends Cubit<SwitchState> {
  SwitchCubit() : super(SwitchInitial());

  changeTheme(ThemeState state) {
    switch (state) {
      case ThemeState.light:
        emit(SwitchLightTheme());
        break;
      case ThemeState.dark:
        emit(SwitchDarkTheme());
        break;
      default:
    }
  }
}
