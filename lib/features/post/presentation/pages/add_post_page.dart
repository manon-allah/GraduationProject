import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../profile/presentation/domain/entities/profile_entity.dart';
import '../manager/cubit/post_cubit.dart';
import 'widgets/custom_add_post_body.dart';

class AddPostPage extends StatefulWidget {
  final ProfileEntity user;
  const AddPostPage({
    super.key,
    required this.user,
  });

  @override
  State<AddPostPage> createState() => _AddPostPageState();
}

class _AddPostPageState extends State<AddPostPage> {
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PostCubit, PostState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is PostsLoading || state is PostsUploading) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        return Scaffold(
          body: CustomAddPostBody(
            user: widget.user,
          ),
        );
      },
    );
  }
}
