import 'package:flutter/material.dart';
import '../../../../auth/domain/entities/user_entity.dart';
import '../../../../home/presentation/pages/widgets/posts/custom_all_comments.dart';
import '../../../../home/presentation/pages/widgets/posts/custom_date_post.dart';
import '../../../../post/domain/entities/post_entity.dart';
import 'custom_favorite_number_likes.dart';
import 'custom_favorite_react.dart';
import 'custom_favorite_user_name_desc.dart';

class CustomFavoriteDescriptionPost extends StatefulWidget {
  final UserEntity currrentUser;
  final PageController nextPage;
  final PostEntity post;
  const CustomFavoriteDescriptionPost({
    super.key,
    required this.currrentUser,
    required this.nextPage,
    required this.post,
  });

  @override
  State<CustomFavoriteDescriptionPost> createState() => _CustomFavoriteDescriptionPostState();
}

class _CustomFavoriteDescriptionPostState extends State<CustomFavoriteDescriptionPost> {
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
          currrentUser: widget.currrentUser,
          nextPage: widget.nextPage,
          post: widget.post,
        ),
        // numbers of likes....etc
        CustomFavoriteNumberLikes(
          post: widget.post,
        ),
        // username description....etc
        CustomFavoriteUserNameDesc(
          post: widget.post,
        ),
        // all comments
        const CustomAllComments(),
        // date of post
        CustomDatePost(
          post: widget.post,
        ),
      ],
    );
  }
}
