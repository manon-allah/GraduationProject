import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_router.dart';

class CustomAppBarProfile extends StatelessWidget {
  const CustomAppBarProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 50,
        left: 10,
      ),
      child: Row(
        children: [
          const Text(
            'username',
            style: TextStyle(
              fontSize: 27,
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(
              right: 15,
            ),
            child: Row(
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
                    GoRouter.of(context).pushNamed(AppRouter.kSettingsScreen);
                  },
                  child: const Icon(
                    Icons.menu,
                    size: 25,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
