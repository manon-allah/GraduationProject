import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_router.dart';

class CustomAppBarProfile extends StatelessWidget {
  const CustomAppBarProfile({
    super.key,
    required this.userName,
  });
  final String userName;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          userName == '' ? 'UserName' : userName,
          style: const TextStyle(
            fontSize: 27,
          ),
        ),
        const Spacer(),
        Row(
          children: [
            IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                GoRouter.of(context).pushNamed(
                  AppRouter.kAddPostScreen,
                );
              },
              icon: const Icon(
                Icons.add_box_outlined,
                size: 25,
              ),
            ),
            IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                GoRouter.of(context).pushNamed(
                  AppRouter.kSettingsScreen,
                );
              },
              icon: const Icon(
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
