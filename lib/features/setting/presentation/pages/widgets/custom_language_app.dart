
import 'package:flutter/material.dart';

class CustomLanguageApp extends StatelessWidget {
  const CustomLanguageApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
