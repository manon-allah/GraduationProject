import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/enums/theme_state.dart';
import '../../manager/switch/switch_cubit.dart';

class CustomLightDarkMode extends StatelessWidget {
  const CustomLightDarkMode({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SwitchCubit, SwitchState>(
      builder: (context, state) {
        final switchCubit = context.read<SwitchCubit>();
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Choose Light mode or Dark mode : ',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              children: [
                SizedBox(
                  width: 190,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      switchCubit.changeTheme(ThemeState.light);
                    },
                    child: const Text(
                      'Light',
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                SizedBox(
                  width: 190,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      switchCubit.changeTheme(ThemeState.dark);
                    },
                    child: const Text(
                      'Dark',
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}