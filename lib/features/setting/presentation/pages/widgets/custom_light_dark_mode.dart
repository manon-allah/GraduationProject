import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/themes/cubit/theme_cubit.dart';

class CustomLightDarkMode extends StatelessWidget {
  const CustomLightDarkMode({super.key});

  @override
  Widget build(BuildContext context) {
    final themeCubit = context.watch<ThemeCubit>();

    bool isDarkMode = themeCubit.isDarkMode;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Choose Light mode or Dark mode : ',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        CupertinoSwitch(
          value: isDarkMode,
          onChanged: (value) {
            themeCubit.toggleTheme();
          },
        ),
      ],
    );
  }
}
