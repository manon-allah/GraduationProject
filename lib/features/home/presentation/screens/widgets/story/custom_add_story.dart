import 'package:flutter/material.dart';

class CustomAddStory extends StatelessWidget {
  const CustomAddStory({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage('assets/posts/2.jpeg'),
            ),
            CircleAvatar(
              radius: 13,
              backgroundColor: Colors.blue,
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Text('UserName'),
      ],
    );
  }
}
