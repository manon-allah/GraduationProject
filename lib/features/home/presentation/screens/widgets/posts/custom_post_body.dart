import 'package:flutter/material.dart';
import 'custom_list_tile_user_name.dart';
import 'custom_post.dart';

class CustomPostBody extends StatelessWidget {
  const CustomPostBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        // list tile user name....etc  
        CustomListTileUserName(),
        // post
        CustomPost(),
      ],
    );
  }
}



