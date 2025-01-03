import 'package:flutter/material.dart';
import 'package:instagram/features/post/domain/entities/post_entity.dart';

import '../../../../auth/domain/entities/user_entity.dart';
import '../../../../home/presentation/pages/widgets/posts/custom_list_tile_user_home.dart';
import '../../../../profile/presentation/domain/entities/profile_entity.dart';
import 'custom_favorite_post.dart';

class CustomPostCard extends StatelessWidget {
  final ProfileEntity? postUser;
  final bool isOwnPost;
  final UserEntity currrentUser;
  final void Function()? toggleLike;
  final Function(String id)? deletePost;
  final PostEntity post;
  const CustomPostCard({
    super.key,
    required this.post,
    required this.currrentUser,
    this.toggleLike,
    required this.postUser,
    required this.isOwnPost,
    this.deletePost,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.symmetric(
        vertical: 8,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomListTileUserHome(
              isOwnPost: isOwnPost,
              post: post,
              postUser: postUser,
              deletePost: deletePost,
            ),
            CustomFavoritePost(
              currrentUser: currrentUser,
              post: post,
              toggleLike: toggleLike,
            ),
          ],
        ),
      ),
    );
  }
}
