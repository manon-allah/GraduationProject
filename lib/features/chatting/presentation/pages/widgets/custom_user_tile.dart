import 'package:flutter/material.dart';

class CustomUserTile extends StatelessWidget {
  final Map<String, dynamic> userData;
  final void Function()? onTap;
  const CustomUserTile({
    super.key,
    required this.userData,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(
        userData['name'] ?? 'Name',
        style: const TextStyle(
          fontSize: 20,
        ),
      ),
      // subtitle: Text(
      //   'message content',
      //   style: TextStyle(
      //     color: Theme.of(context).colorScheme.primary,
      //     overflow: TextOverflow.ellipsis,
      //   ),
      // ),
      leading: CircleAvatar(
        radius: 23,
        backgroundImage: NetworkImage(
          userData['imageProfileUrl'] ??
              'https://img.freepik.com/free-photo/spring-scene-with-flowers-butterfly_23-2150169988.jpg',
        ),
      ),
      // trailing: const CircleAvatar(
      //   radius: 5,
      //   backgroundColor: Colors.blue,
      // ),
    );
  }
}
