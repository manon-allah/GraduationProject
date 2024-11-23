
import 'package:flutter/material.dart';

class CustomNumberOfLikes extends StatelessWidget {
  const CustomNumberOfLikes({
    super.key,
    required this.snap,
  });

  final dynamic snap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 15,
        top: 5,
      ),
      child: Text(
        '${snap['likes'].length} '
        'Likes',
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
