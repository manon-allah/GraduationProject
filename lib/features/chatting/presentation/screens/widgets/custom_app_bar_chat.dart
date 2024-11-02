import 'package:flutter/material.dart';

class CustomAppBarChat extends StatelessWidget {
  const CustomAppBarChat({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(
        left: 15,
        right: 15,
        top: 50,
        bottom: 10,
      ),
      child: Row(
        children: [
          Text(
            'username',
            style: TextStyle(
              fontSize: 25,
            ),
          ),
          Spacer(),
          Icon(
            Icons.messenger_outline_rounded,
            size: 25,
          ),
        ],
      ),
    );
  }
}
