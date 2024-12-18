import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    this.onTap,
  });
  final String text;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 400,
        height: 50,
        decoration: BoxDecoration(
          color: const Color(0xFF00A3FF),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Color(0xFFFFFFFF),
              fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }
}
