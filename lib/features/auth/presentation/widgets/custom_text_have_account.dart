import 'package:flutter/material.dart';

class CustomTextHaveAccount extends StatelessWidget {
  const CustomTextHaveAccount({
    super.key,
    required this.firstText,
    required this.lastText,
    this.onTap,
  });
  final String firstText;
  final String lastText;
  final void Function()? onTap;
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
        InkWell(
          onTap: onTap,
          child: Text(
            lastText,
            style: const TextStyle(
              fontSize: 15,
              color: Color(0xFF202020),
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }
}
