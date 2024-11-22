import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_router.dart';

class CustomButtonEditProfile extends StatelessWidget {
  const CustomButtonEditProfile({
    super.key,
    required this.uId,
    required this.isFollowing,
  });
  final String uId;
  final bool isFollowing;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            CustomButton(
              width: MediaQuery.of(context).size.width - 70,
              fontSize: 18,
              text: 'Edit profile',
              onTap: () {
                GoRouter.of(context).pushNamed(AppRouter.kEditScreen);
              },
              colorText: Colors.black,
              colorContainer: const Color(0xFFEFEFEF),
            ),
            const SizedBox(
              width: 5,
            ),
            Container(
              padding: const EdgeInsets.all(5),
              color: const Color(0xFFEFEFEF),
              child: const Icon(
                Icons.person_add,
              ),
            ),
          ],
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
      ],
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.onTap,
    required this.width,
    required this.text,
    required this.colorText,
    required this.colorContainer,
    required this.fontSize,
  });
  final void Function()? onTap;
  final double width;
  final String text;
  final Color colorText;
  final Color colorContainer;

  final double fontSize;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      // () {
      //
      // },
      child: Container(
        padding: const EdgeInsets.all(5),
        color: colorContainer,
        width: width,
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: fontSize,
              color: colorText,
            ),
          ),
        ),
      ),
    );
  }
}
