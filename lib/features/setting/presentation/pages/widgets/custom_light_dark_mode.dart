import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/themes/cubit/theme_cubit.dart';

class CustomLightDarkMode extends StatelessWidget {
  const CustomLightDarkMode({super.key});

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
          const Text(
            'Dark mode : ',
            style: TextStyle(
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
