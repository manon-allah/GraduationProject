import 'package:flutter/material.dart';

import '../../../../../domain/entities/profile_entity.dart';

class CustomUserNameSomeInformation extends StatelessWidget {
  final ProfileEntity user;
  const CustomUserNameSomeInformation({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          user.userName.isNotEmpty ? user.userName : 'UserName',
          style: const TextStyle(
            fontSize: 24,
          ),
        ),
        Text(
          user.bio.isNotEmpty ? user.bio : 'Empty bio',
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
            user.website.isNotEmpty ? user.website : 'Empty website',
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
