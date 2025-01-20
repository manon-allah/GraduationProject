import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../post/presentation/manager/cubit/post_cubit.dart';
import 'widgets/custom_app_bar.dart';
import 'widgets/custom_home_body.dart';
import 'widgets/stories_list_view_body.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final postCubit = context.read<PostCubit>();

  @override
  void initState() {
    super.initState();
    getAllPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomAppBar(),
      ),
      body: CustomScrollView(
        slivers: [
          const StoriesListViewBody(
              // post:,
              ),
          BlocBuilder<PostCubit, PostState>(
            builder: (context, state) {
              if (state is PostsLoading) {
                return const SliverToBoxAdapter(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              } else if (state is PostsSuccess) {
                final allPosts = state.posts;
                if (allPosts.isEmpty) {
                  return const SliverToBoxAdapter(
                    child: Center(
                      child: Text('No Posts available'),
                    ),
                  );
                }
                return CustomHomeBody(
                  deletePost: deletePost,
                  posts: allPosts,
                );
              } else if (state is PostsError) {
                return SliverToBoxAdapter(
                  child: Center(
                    child: Text(
                      state.message,
                    ),
                  ),
                );
              } else {
                return const SliverToBoxAdapter(
                  child: SizedBox(),
                );
              }
            },
          ),
        ],
      ),
    );
  }

  void getAllPosts() {
    postCubit.getAllPosts();
  }

  void deletePost(String postId) {
    postCubit.deletePost(postId);
    getAllPosts();
  }
}
