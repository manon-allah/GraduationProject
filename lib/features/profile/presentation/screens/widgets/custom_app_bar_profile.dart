import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_router.dart';

class CustomAppBarProfile extends StatelessWidget {
  const CustomAppBarProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'UserNmae',
          style: const TextStyle(
            fontSize: 27,
          ),
        ),
        const Spacer(),
        Row(
          children: [
            const Icon(
              Icons.add_box_outlined,
              size: 25,
            ),
            const SizedBox(
              width: 17,
            ),
            InkWell(
              onTap: () {
                GoRouter.of(context).pushNamed(
                  AppRouter.kSettingsScreen,
                );
              },
              child: const Icon(
                Icons.menu,
                size: 25,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
