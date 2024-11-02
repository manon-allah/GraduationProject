import 'package:flutter/material.dart';

class CustomReactPost extends StatelessWidget {
  const CustomReactPost({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 15,
        ),
        const Icon(
          Icons.favorite_border_outlined,
          size: 25,
        ),
        const SizedBox(
          width: 5,
        ),
        Image.asset(
          'assets/home/comment11.png',
          width: 20,
        ),
        const SizedBox(
          width: 5,
        ),
        Image.asset(
          'assets/home/send11.png',
          width: 22,
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.only(
            right: 15,
          ),
          child: Image.asset(
            'assets/home/save11.png',
            width: 23,
          ),
        ),
      ],
    );
  }
}