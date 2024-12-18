import 'package:flutter/material.dart';
import '../../../../post/domain/entities/post_entity.dart';
import 'posts/custom_post_body.dart';
// import 'stories_list_view_body.dart';

class CustomHomeBody extends StatelessWidget {
  final Function(String id)? deletePost;
  final List<PostEntity> posts;
  const CustomHomeBody({
    super.key,
    required this.posts,
    required this.deletePost,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        // const SliverToBoxAdapter(
        //   child: StoriesListViewBody(
        //       // post:,
        //       ),
        // ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: posts.length,
            (context, index) {
              final post = posts[index];
              return CustomPostBody(
                deletePost: deletePost,
                post: post,
              );
            },
          ),
        ),
      ],
    );
  }
}
