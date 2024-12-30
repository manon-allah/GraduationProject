import 'package:flutter/material.dart';

class CustomLanguageApp extends StatelessWidget {
  const CustomLanguageApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Theme.of(context).colorScheme.primary,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Arabic Language : ',
            style: TextStyle(
              fontSize: 20,
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
    );
  }
}
