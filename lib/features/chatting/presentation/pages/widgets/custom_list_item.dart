import 'package:flutter/material.dart';

import '../chat_body.dart';
import 'custom_user_tile.dart';

class CustomListItem extends StatelessWidget {
  final Map<String, dynamic> userData;
  final BuildContext context;
  const CustomListItem({
    super.key,
    required this.userData,
    required this.context,
  });

  @override
  Widget build(BuildContext context) {
    return CustomUserTile(
      userData: userData,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatBody(
              userData: userData,
            ),
          ),
        );
      },
    );
  }
}
