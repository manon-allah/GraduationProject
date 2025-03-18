import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../auth/domain/entities/user_entity.dart';
import '../../../../post/presentation/manager/cubit/post_cubit.dart';
import '../../../../profile/presentation/domain/entities/profile_entity.dart';
import '../../manager/cubit/favorite_cubit.dart';
import 'custom_post_card.dart';

class CustomFavoriteBody extends StatefulWidget {
  final UserEntity currrentUser;
  final ProfileEntity? postUser;
  final bool isOwnPost;
  const CustomFavoriteBody({
    super.key,
    required this.currrentUser,
    required this.postUser,
    required this.isOwnPost,
  });

  @override
  State<CustomFavoriteBody> createState() => _CustomFavoriteBodyState();
}

class _CustomFavoriteBodyState extends State<CustomFavoriteBody> {
  late final postCubit = context.read<PostCubit>();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCubit, FavoriteState>(
      builder: (context, state) {
        if (state is FavoritesLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is FavoritesLoaded) {
          final favorites = state.favorites;
          if (favorites.isEmpty) {
            return const Center(
              child: Text("No favorites yet!"),
            );
          }
          return ListView.builder(
            itemCount: favorites.length,
            itemBuilder: (context, index) {
              final post = favorites[index];
              return CustomPostCard(
                isOwnPost: widget.isOwnPost,
                postUser: widget.postUser,
                deletePost: deletePost,
                currrentUser: widget.currrentUser,
                post: post,
              );
            },
          );
        } else if (state is FavoritesError) {
          return Center(child: Text(state.message));
        }
        return const Center(
          child: Text("Start adding favorites!"),
        );
      },
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
