import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.text,
    this.controller,
  });

  final String text;
  final TextEditingController? controller;
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
                child: TextField(
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
