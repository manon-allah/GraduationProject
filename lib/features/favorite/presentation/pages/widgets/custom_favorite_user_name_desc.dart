import 'package:flutter/material.dart';

import '../../../../post/domain/entities/post_entity.dart';

class CustomFavoriteUserNameDesc extends StatelessWidget {
  final PostEntity post;
  const CustomFavoriteUserNameDesc({
    super.key,
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 15,
      ),
      child: Row(
        children: [
          Text(
            post.userName.isNotEmpty ? post.userName : 'user name',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            post.description.isNotEmpty ? post.description : 'description',
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
