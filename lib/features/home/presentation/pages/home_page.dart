import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../post/presentation/manager/cubit/post_cubit.dart';
import 'widgets/custom_app_bar.dart';
import 'widgets/custom_home_body.dart';

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
      body: BlocBuilder<PostCubit, PostState>(
        builder: (context, state) {
          if (state is PostsLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is PostsSuccess) {
            final allPosts = state.posts;
            if (allPosts.isEmpty) {
              return const Center(
                child: Text('No Posts available'),
              );
            }
            return CustomHomeBody(
              deletePost: deletePost,
              posts: allPosts,
            );
          } else if (state is PostsError) {
            return Center(
              child: Text(state.message,),
            );
          } else {
            return const SizedBox();
          }
        },
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
