import 'package:flutter/material.dart';
import '../../../../../auth/domain/entities/user_entity.dart';
import '../../../../../post/domain/entities/post_entity.dart';
import 'custom_all_comments.dart';
import 'custom_date_post.dart';
import 'custom_number_of_likes.dart';
import 'custom_react_post_home.dart';
import 'custom_user_name_discription.dart';

class CustomDiscriptionPost extends StatelessWidget {
  final UserEntity currrentUser;
  final void Function()? toggleLike;
  final PageController nextPage;
  final PostEntity post;
  const CustomDiscriptionPost({
    super.key,
    required this.post,
    required this.nextPage,
    required this.toggleLike, 
    required this.currrentUser,
  });

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
          currrentUser: currrentUser,
          toggleLike: toggleLike,
          nextPage: nextPage,
          post: post,
        ),
        // numbers of likes....etc
        CustomNumberOfLikes(
          post: post,
            ),
        // username description....etc
        CustomUserNameDescription(
          post: post,
        ),
        // all comments
        const CustomAllComments(),
        // date of post
        CustomDatePost(
          post: post,
        ),
      ],
    );
  }
}
