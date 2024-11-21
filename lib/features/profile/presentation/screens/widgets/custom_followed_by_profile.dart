
import 'package:flutter/material.dart';

class CustomFollowedByProfile extends StatelessWidget {
  const CustomFollowedByProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        SizedBox(
          width: 100,
          child: Stack(
            children: [
              Positioned(
                left: 40,
                child: CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage('assets/posts/4.jpeg'),
                ),
              ),
              Positioned(
                left: 20,
                child: CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage('assets/posts/3.jpeg'),
                ),
              ),
              CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage('assets/posts/2.jpeg'),
              ),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text('Followed by '),
                Text(
                  'username,username',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            Text('and 100 others'),
          ],
        ),
      ],
    );
  }
}
