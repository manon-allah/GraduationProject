
import 'package:flutter/material.dart';

import 'custom_all_comments.dart';
import 'custom_date_post.dart';
import 'custom_number_of_likes.dart';
import 'custom_react_post_home.dart';
import 'custom_user_name_discription.dart';

class CustomDiscriptionPost extends StatelessWidget {
  const CustomDiscriptionPost({
    super.key,
    required this.likeCubit,
    required this.snap,
  });

  final dynamic likeCubit;
  final dynamic snap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 15,
        ),
        // react in post....etc
        CustomReactPostHome(
          likeCubit: likeCubit,
          snap: snap,
        ),
        // numbers of likes....etc
        CustomNumberOfLikes(
          snap: snap,
        ),
        // username description....etc
        CustomUserNameDescription(
          snap: snap,
        ),
        // all comments
        const CustomAllComments(),
        // date of post
        CustomDatePost(
          snap: snap,
        ),
      ],
    );
  }
}
