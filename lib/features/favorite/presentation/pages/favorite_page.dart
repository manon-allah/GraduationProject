import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram/features/favorite/presentation/pages/widgets/custom_favorite_body.dart';
import 'package:instagram/features/post/domain/entities/post_entity.dart';

import '../../../auth/domain/entities/user_entity.dart';
import '../../../auth/presentation/manager/cubit/auth_cubit.dart';
import '../../../post/presentation/manager/cubit/post_cubit.dart';
import '../../../profile/presentation/domain/entities/profile_entity.dart';
import '../../../profile/presentation/presentation/manager/cubit/profile_cubit.dart';

class FavoritePage extends StatefulWidget {
  final PostEntity post;
  const FavoritePage({
    super.key,
    required this.post,
  });

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  late final postCubit = context.read<PostCubit>();
  late final profileCubit = context.read<ProfileCubit>();

  bool isOwnPost = false;

  UserEntity? currrentUser;

  ProfileEntity? postUser;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
    getPostUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All posts'),
      ),
      body: CustomFavoriteBody(
        isOwnPost: isOwnPost,
        postUser: postUser,
        currrentUser: currrentUser!,
        toggleLike: toggleLike,
      ),
    );
  }

  void getCurrentUser() async {
    final authCubit = context.read<AuthCubit>();
    currrentUser = authCubit.currentUser;

    isOwnPost = (widget.post.userId == currrentUser!.uid);
  }

  Future<void> getPostUser() async {
    final getedUser = await profileCubit.getProfile(widget.post.userId);
    if (getedUser != null) {
      setState(() {
        postUser = getedUser;
      });
    }
  }

  void toggleLike() async {
    final isLiked = widget.post.likes.contains(currrentUser!.uid);

    setState(() {
      if (isLiked) {
        widget.post.likes.remove(currrentUser!.uid);
      } else {
        widget.post.likes.add(currrentUser!.uid);
      }
    });

    postCubit
        .toggleLikePost(widget.post.id, currrentUser!.uid)
        .catchError((error) {
      setState(() {
        if (isLiked) {
          widget.post.likes.add(currrentUser!.uid);
        } else {
          widget.post.likes.remove(currrentUser!.uid);
        }
      });
    });
  }
}
