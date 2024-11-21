
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_router.dart';

class CustomButtonEditProfile extends StatelessWidget {
  const CustomButtonEditProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            GoRouter.of(context).pushNamed(AppRouter.kEditScreen);
          },
          child: Container(
            padding: const EdgeInsets.all(5),
            width: MediaQuery.of(context).size.width - 70,
            child: const Center(
              child: Text(
                'Edit profile',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ),
        // InkWell(
        //   onTap: () {},
        //   child: Container(
        //     padding: const EdgeInsets.all(5),
        //     width: MediaQuery.of(context).size.width - 70,
        //     child: const Center(
        //       child: Text(
        //         'UnFollow',
        //         style: TextStyle(
        //           fontSize: 18,
        //         ),
        //       ),
        //     ),
        //   ),
        // ),
        // InkWell(
        //   onTap: () {},
        //   child: Container(
        //     padding: const EdgeInsets.all(5),
        //     color: Colors.blue,
        //     width: MediaQuery.of(context).size.width - 70,
        //     child: const Center(
        //       child: Text(
        //         'Follow',
        //         style: TextStyle(
        //           fontSize: 20,
        //           color: Colors.white,
        //         ),
        //       ),
        //     ),
        //   ),
        // ),
        const SizedBox(
          width: 5,
        ),
        const Icon(Icons.person_add),
      ],
    );
  }
}
