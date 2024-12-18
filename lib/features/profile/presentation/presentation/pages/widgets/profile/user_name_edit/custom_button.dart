import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onTap;
  final double width;
  final String text;
  final Color colorText;
  final Color? colorContainer;
  final double fontSize;
  const CustomButton({
    super.key,
    this.onTap,
    this.colorContainer,
    required this.width,
    required this.text,
    required this.colorText,
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: colorContainer,
          borderRadius: BorderRadius.circular(16),
        ),
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
