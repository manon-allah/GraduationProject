import 'package:flutter/material.dart';

import 'custom_text_field.dart';

class CustomUserInfo extends StatelessWidget {
  const CustomUserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CustomTextField(
          text: 'Name',
        ),
        CustomTextField(
          text: 'UserName',
        ),
        CustomTextField(
          text: 'Website',
        ),
        CustomTextField(
          text: 'Bio',
        ),
      ],
    );
  }
}
