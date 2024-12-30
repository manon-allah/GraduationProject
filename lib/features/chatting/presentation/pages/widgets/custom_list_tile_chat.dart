import 'package:flutter/material.dart';

class CustomListTileChat extends StatelessWidget {
  const CustomListTileChat({super.key});

  @override
  Widget build(BuildContext context) {
    return const ListTile(
      title: Text('username'),
      subtitle: Text('message content'),
      leading: CircleAvatar(
        radius: 23,
        backgroundImage: AssetImage('assets/posts/2.jpeg'),
      ),
      trailing: CircleAvatar(
        radius: 5,
        backgroundColor: Colors.blue,
      ),
    );
  }
}
