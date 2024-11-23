
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.onTap,
    required this.width,
    required this.text,
    required this.colorText,
    required this.colorContainer,
    required this.fontSize,
  });
  final void Function()? onTap;
  final double width;
  final String text;
  final Color colorText;
  final Color colorContainer;

  final double fontSize;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(5),
        color: colorContainer,
        width: width,
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: fontSize,
              color: colorText,
            ),
          ),
        ),
      ),
    );
  }
}
