import 'package:flutter/material.dart';
import 'custom_discription_post.dart';

class CustomPostCardHome extends StatelessWidget {
  const CustomPostCardHome({
    super.key,
    required this.snap,
    required this.likeCubit,
  });

  final snap;
  final likeCubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 5,
          ),
          child: Image.network(
            snap['postUrl'],
            fit: BoxFit.fill,
            width: double.infinity,
            height: 390,
          ),
        ),
        // description of post
        CustomDiscriptionPost(
          likeCubit: likeCubit,
          snap: snap,
        ),
      ],
    );
  }
}
