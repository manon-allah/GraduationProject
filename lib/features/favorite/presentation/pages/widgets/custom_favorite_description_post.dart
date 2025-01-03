import 'package:flutter/material.dart';
import '../../../../auth/domain/entities/user_entity.dart';
import '../../../../home/presentation/pages/widgets/posts/custom_all_comments.dart';
import '../../../../home/presentation/pages/widgets/posts/custom_date_post.dart';
import '../../../../post/domain/entities/post_entity.dart';
import 'custom_favorite_number_likes.dart';
import 'custom_favorite_react.dart';
import 'custom_favorite_user_name_desc.dart';

class CustomFavoriteDescriptionPost extends StatelessWidget {
  final UserEntity currrentUser;
  final void Function()? toggleLike;
  final PageController nextPage;
  final PostEntity post;
  const CustomFavoriteDescriptionPost({
    super.key,
    required this.currrentUser,
    this.toggleLike,
    required this.nextPage,
    required this.post,
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
        CustomFavoriteReact(
          currrentUser: currrentUser,
          toggleLike: toggleLike,
          nextPage: nextPage,
          post: post,
        ),
        // numbers of likes....etc
        CustomFavoriteNumberLikes(
          post: post,
        ),
        // username description....etc
        CustomFavoriteUserNameDesc(
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
