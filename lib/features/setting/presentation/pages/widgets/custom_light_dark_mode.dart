import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/themes/cubit/theme_cubit.dart';
import '../../../../../lang/locale_keys.g.dart';

class CustomLightDarkMode extends StatefulWidget {
  const CustomLightDarkMode({super.key});

  @override
  State<CustomLightDarkMode> createState() => _CustomLightDarkModeState();
}

class _CustomLightDarkModeState extends State<CustomLightDarkMode> {
  @override
  Widget build(BuildContext context) {
    final themeCubit = context.watch<ThemeCubit>();

    bool isDarkMode = themeCubit.isDarkMode;

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Theme.of(context).colorScheme.primary,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            LocaleKeys.darkModeTitle.tr(),
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
          CupertinoSwitch(
            value: isDarkMode,
            onChanged: (value) {
              themeCubit.toggleTheme();
            },
          ),
        ],
      ),
    );
  }
}
