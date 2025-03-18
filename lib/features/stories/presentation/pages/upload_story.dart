import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram/features/profile/presentation/domain/entities/profile_entity.dart';
import 'package:instagram/features/stories/presentation/manager/cubit/story_cubit.dart';
import 'widgets/custom_upload_story.dart';

class UploadStory extends StatelessWidget {
  final ProfileEntity user;
  const UploadStory({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StoryCubit, StoryState>(
      builder: (context, state) {
        if (state is StoryLoading || state is StoryUploading) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        return Scaffold(
          body: CustomUploadStory(
            user: user,
          ),
        );
      },
    );
  }
}
