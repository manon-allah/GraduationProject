import 'package:flutter/material.dart';

import 'widgets/custom_add_post_body.dart';

class AddPostScreens extends StatelessWidget {
  const AddPostScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Post'),
        actions: [
          TextButton(
              onPressed: () {},
              child: const Text(
                'Post',
                style: TextStyle(
                  fontSize: 23,
                  color: Colors.blue,
                ),
              )),
        ],
      ),
      body: const CustomAddPostBody(),
    );
  }
}
