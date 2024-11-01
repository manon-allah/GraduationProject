import 'package:flutter/material.dart';

class CustomColumnTextNum extends StatelessWidget {
  const CustomColumnTextNum({
    super.key,
    required this.num,
    required this.text,
  });
  final String num;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(num),
        Text(text),
      ],
    );
  }
}
