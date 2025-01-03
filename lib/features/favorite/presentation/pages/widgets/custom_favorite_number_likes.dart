import 'package:flutter/material.dart';
import 'package:instagram/features/post/domain/entities/post_entity.dart';

class CustomFavoriteNumberLikes extends StatelessWidget {
  final PostEntity post;
  const CustomFavoriteNumberLikes({
    super.key,
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 15,
        top: 5,
      ),
      child: Row(
        children: [
          SizedBox(
            width: 20,
            child: Text(
              '${post.likes.length}',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const Text(
            'Likes',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
