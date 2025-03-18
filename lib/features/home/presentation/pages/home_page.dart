import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram/features/auth/domain/entities/user_entity.dart';
import 'package:instagram/features/profile/presentation/presentation/manager/cubit/profile_cubit.dart';
import 'package:instagram/features/stories/presentation/manager/cubit/story_cubit.dart';
import '../../../../lang/locale_keys.g.dart';
import '../../../auth/presentation/manager/cubit/auth_cubit.dart';
import '../../../post/presentation/manager/cubit/post_cubit.dart';
import 'widgets/custom_app_bar.dart';
import 'widgets/custom_home_body.dart';
import '../../../stories/presentation/pages/widgets/stories_list_view_body.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final postCubit = context.read<PostCubit>();
  late final profileCubit = context.read<ProfileCubit>();
  late final storyCubit = context.read<StoryCubit>();

  UserEntity? currentUser;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
    getAllStories();
    getAllPosts();
    profileCubit.getCurrentProfile(
      currentUser!.uid,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            if (state is ProfileSuccess) {
              final user = state.profile;
              return CustomAppBar(
                user: user,
              );
            }
            return const SizedBox();
          },
        ),
      ),
      body: CustomScrollView(
        slivers: [
          BlocBuilder<ProfileCubit, ProfileState>(
            builder: (context, state) {
              if (state is ProfileSuccess) {
                final user = state.profile;
                return StoriesListViewBody(
                  user: user,
                );
              }
              return const SliverToBoxAdapter(
                child: SizedBox(),
              );
            },
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
                  return SliverToBoxAdapter(
                    child: Center(
                      child: Text(LocaleKeys.noPostsAvailableTitle.tr()),
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

  getCurrentUser() {
    final authCubit = context.read<AuthCubit>();
    currentUser = authCubit.currentUser;
  }

  void getAllPosts() {
    postCubit.getAllPosts();
  }

  void getAllStories() {
    storyCubit.getAllStories();
  }

  void deletePost(String postId) {
    postCubit.deletePost(postId);
    getAllPosts();
  }
}
