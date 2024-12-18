import 'package:flutter/material.dart';

class CustomTextFieldEditProfile extends StatelessWidget {
  final TextEditingController? controller;
  final String hint;
  final String text;
  const CustomTextFieldEditProfile({
    super.key,
    this.controller,
    required this.hint,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                text,
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
              const Spacer(),
              SizedBox(
                width: 270,
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: hint,
                    hintStyle: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  controller: controller,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
