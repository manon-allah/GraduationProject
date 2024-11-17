import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../../../core/services/caching.dart';
import '../../../data/enums/theme_state.dart';

part 'switch_state.dart';

class SwitchCubit extends Cubit<SwitchState> {
  SwitchCubit() : super(SwitchInitial());

  var cashing = CacheHelper();

  changeTheme(ThemeState state) {
    switch (state) {
      case ThemeState.initial:
        if (cashing.getData(key: 'theme') != null) {
          if (cashing.getData(key: 'theme') == 'l') {
            emit(SwitchLightTheme());
          } else {
            emit(SwitchDarkTheme());
          }
        }
        break;
      case ThemeState.light:
        cashing.setData(key: 'theme', value: 'l');
        emit(SwitchLightTheme());
        break;
      case ThemeState.dark:
        cashing.setData(key: 'theme', value: 'd');
        emit(SwitchDarkTheme());
        break;
      default:
    }
  }
}
