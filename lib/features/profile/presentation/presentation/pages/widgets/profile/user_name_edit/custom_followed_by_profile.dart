import 'package:flutter/material.dart';

class CustomFollowedByProfile extends StatelessWidget {
  const CustomFollowedByProfile({super.key});

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
                  backgroundImage: NetworkImage(
                      'https://plus.unsplash.com/premium_photo-1673448391005-d65e815bd026?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cGhvdG98ZW58MHx8MHx8fDA%3D'),
                ),
              ),
              Positioned(
                left: 20,
                child: CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(
                      'https://images.unsplash.com/photo-1541516160071-4bb0c5af65ba?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTZ8fHBob3RvZ3JhcGh5fGVufDB8fDB8fHww'),
                ),
              ),
              CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(
                    'https://images.pexels.com/photos/3680219/pexels-photo-3680219.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
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
