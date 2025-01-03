import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../auth/domain/entities/user_entity.dart';
import '../../../../../auth/presentation/manager/cubit/auth_cubit.dart';
import '../../../../../post/domain/entities/post_entity.dart';
import '../../../../../post/presentation/manager/cubit/post_cubit.dart';
import '../../../../../profile/presentation/domain/entities/profile_entity.dart';
import '../../../../../profile/presentation/presentation/manager/cubit/profile_cubit.dart';
import 'custom_list_tile_user_home.dart';
import 'custom_post_card_home.dart';

class CustomPostBody extends StatefulWidget {
  final Function(String id)? deletePost;
  final PostEntity post;
  const CustomPostBody({
    super.key,
    required this.post,
    required this.deletePost,
  });

  @override
  State<CustomPostBody> createState() => _CustomPostBodyState();
}

class _CustomPostBodyState extends State<CustomPostBody> {
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
    return Column(
      children: [
        // list tile user name....etc
        CustomListTileUserHome(
          isOwnPost: isOwnPost,
          postUser: postUser,
          deletePost: widget.deletePost,
          post: widget.post,
        ),
        // post card
        CustomPostCardHome(
          currrentUser: currrentUser!,
          toggleLike: toggleLike,
          post: widget.post,
        ),
      ],
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

  void toggleLike() async{
    final isLiked = widget.post.likes.contains(currrentUser!.uid);

    setState(() {
      if (isLiked) {
        widget.post.likes.remove(currrentUser!.uid);
      } else {
        widget.post.likes.add(currrentUser!.uid);
      }
    });

    postCubit.toggleLikePost(widget.post.id, currrentUser!.uid).catchError((error) {
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
