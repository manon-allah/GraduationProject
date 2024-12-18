import 'package:flutter/material.dart';
import '../../../../../auth/domain/entities/user_entity.dart';
import '../../../../../post/domain/entities/post_entity.dart';
import 'custom_discription_post.dart';

class CustomPostCardHome extends StatefulWidget {
    final UserEntity currrentUser;
  final void Function()? toggleLike;
  final PostEntity post;
  const CustomPostCardHome({
    super.key,
    required this.post,
    required this.toggleLike, 
    required this.currrentUser,
  });

  @override
  State<CustomPostCardHome> createState() => _CustomPostCardHomeState();
}

class _CustomPostCardHomeState extends State<CustomPostCardHome> {
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
                  return Image.network(
                    widget.post.postImageUrl![index],
                    fit: BoxFit.fill,
                  );
                }),
          ),
        ),
        // description of post
        CustomDiscriptionPost(
          currrentUser: widget.currrentUser,
          toggleLike: widget.toggleLike,
          nextPage: nextPage,
          post: widget.post,
        ),
      ],
    );
  }
}
