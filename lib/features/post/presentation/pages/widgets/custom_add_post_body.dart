import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/functions/select_image.dart';
import '../../../../../core/functions/show_snake_bar.dart';
import '../../../../auth/domain/entities/user_entity.dart';
import '../../../../auth/presentation/manager/cubit/auth_cubit.dart';
import '../../../../profile/presentation/domain/entities/profile_entity.dart';
import '../../manager/cubit/post_cubit.dart';

class CustomAddPostBody extends StatefulWidget {
  final ProfileEntity user;
  const CustomAddPostBody({
    super.key,
    required this.user,
  });

  @override
  State<CustomAddPostBody> createState() => _CustomAddPostBodyState();
}

class _CustomAddPostBodyState extends State<CustomAddPostBody> {
  final TextEditingController captionController = TextEditingController();

  List<String>? imgs = [];

  UserEntity? currentUser;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            // app bar
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                  ),
                ),
                const Text(
                  'Add Post',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(
                    right: 8,
                  ),
                  child: TextButton(
                    onPressed: uploadPost,
                    child: const Text(
                      'Post',
                      style: TextStyle(
                        fontSize: 23,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            ///////////////////
            // content
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                    top: 20,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Profile picture
                          CachedNetworkImage(
                            imageUrl: widget.user.imageProfileUrl,
                            placeholder: (context, url) =>
                                const CircularProgressIndicator(),
                            errorWidget: (context, url, error) => Icon(
                              Icons.person,
                              size: 40,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                            imageBuilder: (context, imageProvider) => Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: imageProvider,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          // write a caption
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.7,
                            child: TextField(
                              controller: captionController,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Write a caption...',
                              ),
                              maxLines: 3,
                            ),
                          ),
                        ],
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
                      // post photos
                      imgs!.isNotEmpty
                          ? SizedBox(
                              height: 700,
                              child: GridView.builder(
                                itemCount: imgs!.length,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  mainAxisSpacing: 1,
                                  crossAxisSpacing: 1,
                                ),
                                itemBuilder: (context, index) {
                                  return Image.file(
                                    File(imgs![index]),
                                    fit: BoxFit.fill,
                                  );
                                },
                              )
                              )
                          : const SizedBox(),
                    ],
                  ),
                ),
              ],
            ),
          ],
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
            title: const Text('Create a Post'),
            children: [
              SimpleDialogOption(
                padding: const EdgeInsets.all(20),
                child: const Text('choose the Photo'),
                onPressed: () async {
                  Navigator.pop(context);
                  final List<String> images = await selectImage();
                  setState(() {
                    imgs = images;
                  });
                  print('images is =================== $imgs');
                },
              ),
              SimpleDialogOption(
                padding: const EdgeInsets.all(20),
                child: const Text('Cancel'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }

  uploadPost() {
    if (imgs == null && captionController.text.isEmpty) {
      showSnackbar('Both image and caption are required', context);
      return;
    }

    final postCubit = context.read<PostCubit>();

    postCubit.addPost(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      userId: currentUser!.uid,
      userName: widget.user.userName,
      description: captionController.text,
      datePublished: DateTime.now(),
      imageUrls: imgs!,
      profileImageUrl: widget.user.imageProfileUrl,
      bio: widget.user.bio,
    );
  }

  @override
  void dispose() {
    super.dispose();
    captionController.dispose();
  }
}
