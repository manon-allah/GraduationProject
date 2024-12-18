import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../services/caching.dart';
import '../dark_theme.dart';
import '../light_theme.dart';

class ThemeCubit extends Cubit<ThemeData> {
  bool _isDarkTheme = false;

  ThemeCubit() : super(lightMode);

  bool get isDarkMode => _isDarkTheme;

  void toggleTheme() {
    _isDarkTheme = !_isDarkTheme;
    if (_isDarkTheme) {
      CacheHelper.setData(key: 'theme', value: 'd');
      emit(darkMode);
    } else {
      CacheHelper.setData(key: 'theme', value: 'l');
      emit(lightMode);
    }
  }
}
