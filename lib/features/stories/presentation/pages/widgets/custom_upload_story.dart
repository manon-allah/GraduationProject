import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram/features/profile/presentation/domain/entities/profile_entity.dart';
import 'package:instagram/features/stories/presentation/manager/cubit/story_cubit.dart';

import '../../../../../core/functions/select_image.dart';
import '../../../../../core/functions/show_snake_bar.dart';
import '../../../../auth/domain/entities/user_entity.dart';
import '../../../../auth/presentation/manager/cubit/auth_cubit.dart';

class CustomUploadStory extends StatefulWidget {
  final ProfileEntity user;
  const CustomUploadStory({
    super.key,
    required this.user,
  });

  @override
  State<CustomUploadStory> createState() => _CustomUploadStoryState();
}

class _CustomUploadStoryState extends State<CustomUploadStory> {
  List<String>? imgPath = [];

  UserEntity? currentUser;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.only(
          top: 15,
          left: 5,
          right: 10,
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_rounded,
                      size: 25,
                    ),
                  ),
                  const Text(
                    'Upload Story',
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () => uploadStory(),
                    icon: const Icon(
                      Icons.upload_rounded,
                      size: 25,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              TextButton(
                onPressed: () => chooseImage(context),
                child: const Text(
                  'choose photo',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              imgPath!.isNotEmpty
                  ? SizedBox(
                      height: 500,
                      child: GridView.builder(
                        itemCount: imgPath!.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 1,
                          crossAxisSpacing: 1,
                        ),
                        itemBuilder: (context, index) {
                          return Image.file(
                            File(imgPath![index]),
                            fit: BoxFit.fill,
                          );
                        },
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }

  getCurrentUser() {
    final authCubit = context.read<AuthCubit>();
    currentUser = authCubit.currentUser;
  }

  chooseImage(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: const Text('Create a Story'),
            children: [
              SimpleDialogOption(
                padding: const EdgeInsets.all(20),
                child: const Text('choose the Photo'),
                onPressed: () async {
                  Navigator.pop(context);
                  final List<String> images = await selectImage();
                  setState(() {
                    imgPath = images;
                  });
                  log('images is =================== $imgPath');
                },
              ),
              SimpleDialogOption(
                padding: const EdgeInsets.all(
                  20,
                ),
                child: const Text('Cancel'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }

  uploadStory() {
    if (imgPath == null) {
      showSnackbar('Both image and caption are required', context);
      return;
    }

    final storyCubit = context.read<StoryCubit>();

    storyCubit.addStory(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      userId: currentUser!.uid,
      userName: widget.user.userName,
      datePublished: DateTime.now(),
      imageUrls: imgPath!,
      profileImageUrl: widget.user.imageProfileUrl,
    );
  }
}
