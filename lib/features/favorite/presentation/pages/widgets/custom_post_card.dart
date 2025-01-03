import 'package:flutter/material.dart';
import 'package:instagram/features/post/domain/entities/post_entity.dart';

import '../../../../auth/domain/entities/user_entity.dart';
import '../../../../home/presentation/pages/widgets/posts/custom_list_tile_user_home.dart';
import '../../../../profile/presentation/domain/entities/profile_entity.dart';
import 'custom_favorite_post.dart';

class CustomPostCard extends StatefulWidget {
  final ProfileEntity? postUser;
  final bool isOwnPost;
  final UserEntity currrentUser;
  final Function(String id)? deletePost;
  final PostEntity post;
  const CustomPostCard({
    super.key,
    required this.post,
    required this.currrentUser,
    required this.postUser,
    required this.isOwnPost,
    this.deletePost,
  });

  @override
  State<CustomPostCard> createState() => _CustomPostCardState();
}

class _CustomPostCardState extends State<CustomPostCard> {
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
              isOwnPost: widget.isOwnPost,
              post: widget.post,
              postUser: widget.postUser,
              deletePost: widget.deletePost,
            ),
            CustomFavoritePost(
              currrentUser: widget.currrentUser,
              post: widget.post,
            ),
          ],
        ),
      ),
    );
  }
}
