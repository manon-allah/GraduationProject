import 'package:flutter/material.dart';

class CustomTextHaveAccount extends StatelessWidget {
  const CustomTextHaveAccount({super.key, required this.firstText, required this.lastText,});
  final String firstText;
  final String lastText;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          firstText,
          style: const TextStyle(
            fontSize: 13,
            color: Color(0xFF202020),
          ),
        ),
        Text(
          lastText,
          style: const TextStyle(
            fontSize: 15,
            color: Color(0xFF202020),
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
