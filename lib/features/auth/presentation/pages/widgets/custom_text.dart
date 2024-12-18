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
          style: TextStyle(
            fontSize: 13,
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
        ),
        TextButton(
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
          ),
          onPressed: onTap,
          child: Text(
            lastText,
            style: TextStyle(
              fontSize: 15,
              color: Theme.of(context).colorScheme.inversePrimary,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }
}
