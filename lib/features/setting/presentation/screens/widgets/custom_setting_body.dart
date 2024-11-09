import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram/features/setting/data/enums/theme_state.dart';
import 'package:instagram/features/setting/presentation/manager/switch/switch_cubit.dart';

class CustomSettingBody extends StatefulWidget {
  const CustomSettingBody({super.key});

  @override
  State<CustomSettingBody> createState() => _CustomSettingBodyState();
}

class _CustomSettingBodyState extends State<CustomSettingBody> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SwitchCubit, SwitchState>(
      listener: (context, state) {},
      builder: (context, state) {
        final switchCubit = context.read<SwitchCubit>();
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 50,
              ),
              Column(
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
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  const Text(
                    'Choose Arabic or English Language',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  InkWell(
                    onTap: () {},
                    child: const Icon(
                      Icons.language_rounded,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
