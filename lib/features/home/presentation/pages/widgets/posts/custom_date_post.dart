import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../post/domain/entities/post_entity.dart';

class CustomDatePost extends StatelessWidget {
  final PostEntity post;
  const CustomDatePost({
    super.key,
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 15,
      ),
      child: Text(
        DateFormat.yMMMd().format(
          post.datePublished,
        ),
        style: const TextStyle(
          color: Colors.grey,
          fontSize: 17,
        ),
      ),
    );
  }
}
