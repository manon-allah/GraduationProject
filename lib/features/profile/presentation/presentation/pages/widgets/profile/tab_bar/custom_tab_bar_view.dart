import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../post/presentation/manager/cubit/post_cubit.dart';

class CustomTabBarView extends StatelessWidget {
  final String uid;
  const CustomTabBarView({
    super.key,
    required this.uid,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostCubit, PostState>(
      builder: (context, state) {
        if (state is PostsSuccess) {
          final posts =
              state.posts.where((post) => post.userId == uid).toList();
          return GridView.builder(
            itemCount: posts.length,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 1,
              crossAxisSpacing: 1,
            ),
            itemBuilder: (context, index) {
              final post = posts[index];
              return Image.network(
                post.postImageUrl!.first.isNotEmpty
                    ? post.postImageUrl!.first
                    : 'https://static.vecteezy.com/system/resources/thumbnails/011/991/883/small/the-concept-was-discouraged-and-hopeless-a-lonely-and-heartbreaking-concept-free-photo.jpg',
                fit: BoxFit.fill,
              );
            },
          );
        } else if (state is PostsLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return const Center(
            child: Text('No posts found...'),
          );
        }
      },
    );
  }
}
