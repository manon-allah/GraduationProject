import 'package:flutter/material.dart';

class CustomMediaGrid extends StatelessWidget {
  const CustomMediaGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/posts/2.jpeg',
      fit: BoxFit.fill,
    );
  }
}
