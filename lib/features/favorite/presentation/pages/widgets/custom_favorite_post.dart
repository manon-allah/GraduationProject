import 'package:flutter/material.dart';
import 'package:instagram/features/post/domain/entities/post_entity.dart';

import '../../../../auth/domain/entities/user_entity.dart';
import 'custom_favorite_description_post.dart';

class CustomFavoritePost extends StatefulWidget {
  final UserEntity currrentUser;
  final void Function()? toggleLike;
  final PostEntity post;
  const CustomFavoritePost({
    super.key,
    required this.post,
    required this.currrentUser,
    this.toggleLike,
  });

  @override
  State<CustomFavoritePost> createState() => _CustomFavoritePostState();
}

class _CustomFavoritePostState extends State<CustomFavoritePost> {
  PageController nextPage = PageController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 5,
          ),
          child: SizedBox(
            height: 400,
            child: PageView.builder(
                controller: nextPage,
                itemCount: widget.post.postImageUrl!.length,
                itemBuilder: (context, index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      widget.post.postImageUrl![index],
                      fit: BoxFit.fill,
                    ),
                  );
                }),
          ),
        ),
        // description of post
        CustomFavoriteDescriptionPost(
          currrentUser: widget.currrentUser,
          toggleLike: widget.toggleLike,
          nextPage: nextPage,
          post: widget.post,
        ),
      ],
    );
  }
}
