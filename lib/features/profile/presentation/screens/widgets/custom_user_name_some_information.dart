import 'package:flutter/material.dart';

class CustomUserNameSomeInformation extends StatelessWidget {
  const CustomUserNameSomeInformation({
    super.key,
    required this.userData,
  });

  final Map<String, dynamic> userData;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          userData['userName'] ?? 'username',
          style: const TextStyle(
            fontSize: 24,
          ),
        ),
        Text(
          userData['bio'] ?? 'bio',
          style: const TextStyle(
            fontSize: 20,
            color: Colors.grey,
          ),
        ),
        const Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt #hashtag'),
        TextButton(
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
          ),
          onPressed: () {},
          child: Text(
            userData['website'] ?? 'Website',
            style: const TextStyle(
              fontSize: 18,
              color: Colors.blue,
            ),
          ),
        ),
      ],
    );
  }
}
