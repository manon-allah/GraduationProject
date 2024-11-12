import 'package:flutter/material.dart';

import 'widgets/custom_add_post_body.dart';

class AddPostScreens extends StatelessWidget {
  const AddPostScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomAddPostBody(),
    );
  }
}