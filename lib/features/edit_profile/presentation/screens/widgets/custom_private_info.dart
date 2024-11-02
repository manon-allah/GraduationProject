import 'package:flutter/material.dart';

import 'custom_text_field.dart';

class CustomPrivateInfo extends StatelessWidget {
  const CustomPrivateInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CustomTextField(
          text: 'Email',
        ),
        CustomTextField(
          text: 'Phone',
        ),
        CustomTextField(
          text: 'Gender',
        ),
      ],
    );
  }
}
