import 'package:flutter/material.dart';

class CustomColumnTextNum extends StatelessWidget {
  const CustomColumnTextNum({
    super.key,
    required this.num,
    required this.text,
  });
  final int num;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          num.toString(),
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          text,
          style: const TextStyle(
            fontSize: 17,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
