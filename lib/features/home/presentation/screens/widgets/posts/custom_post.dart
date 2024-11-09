import 'package:flutter/material.dart';
import 'custom_like_number.dart';
import 'custom_react_post.dart';
import 'custom_user_description.dart';

class CustomPost extends StatelessWidget {
  const CustomPost({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'assets/posts/3.jpeg',
          fit: BoxFit.fill,
          width: double.infinity,
          height: 390,
        ),
        Container(
          color: Colors.white,
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 15,
              ),
              // react in prost....etc
              CustomReactPost(),
              // numbers of likes....etc
              CustomLikeNumber(),
              // username description....etc
              CustomUserNameDescription(),
            ],
          ),
        ),
      ],
    );
  }
}
