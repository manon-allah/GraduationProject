import 'package:flutter/material.dart';

class CustomSettingBody extends StatelessWidget {
  const CustomSettingBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 50,
          ),
          const Row(
            children: [
              Text(
                'Choose Light mode or Dark mode',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          Row(
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
          ),
        ],
      ),
    );
  }
}
