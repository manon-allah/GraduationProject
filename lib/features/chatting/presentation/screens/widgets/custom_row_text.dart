import 'package:flutter/material.dart';

class CustomRowText extends StatelessWidget {
  const CustomRowText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 15,
      ),
      child: Row(
        children: [
          Text(
            'Messages',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          Spacer(),
          Row(
            children: [
              Text(
                'Requests',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              Icon(
                Icons.arrow_forward_ios_rounded,
                size: 15,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
