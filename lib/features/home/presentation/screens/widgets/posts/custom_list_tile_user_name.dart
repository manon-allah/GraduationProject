import 'package:flutter/material.dart';

class CustomListTileUserName extends StatelessWidget {
  const CustomListTileUserName({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const ListTile(
      leading: CircleAvatar(
        radius: 22,
        backgroundColor: Colors.red,
        child: CircleAvatar(
          radius: 20,
          backgroundImage: AssetImage('assets/posts/2.jpeg'),
        ),
      ),
      title: Text(
        'UserName',
        style: TextStyle(
          fontSize: 15,
        ),
      ),
      subtitle: Text(
        'Status',
        style: TextStyle(
          fontSize: 13,
        ),
      ),
      trailing: Icon(Icons.more_horiz),
    );
  }
}
