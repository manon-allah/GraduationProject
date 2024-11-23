
import 'package:flutter/material.dart';

class CustomUserNameDescription extends StatelessWidget {
  const CustomUserNameDescription({
    super.key,
    required this.snap,
  });

  final dynamic snap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 15,
      ),
      child: Row(
        children: [
          Text(
            snap['userName'],
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            snap['description'],
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
