import 'package:flutter/material.dart';

class CustomLikeNumber extends StatelessWidget {
  const CustomLikeNumber({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(
        left: 20,
        top: 5,
      ),
      child: Text(
        '0 '
        'Likes',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
