import 'dart:developer';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/functions/select_image.dart';
import '../../../../../core/functions/show_snake_bar.dart';
import '../../../../../lang/locale_keys.g.dart';
import '../../../../auth/domain/entities/user_entity.dart';
import '../../../../auth/presentation/manager/cubit/auth_cubit.dart';
import '../../../../profile/presentation/domain/entities/profile_entity.dart';
import '../../manager/cubit/post_cubit.dart';
import 'custom_grid_view_photos.dart';
import 'custom_profile_cashed_network.dart';
import 'custom_text_field_caption.dart';

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
                Text(
                  LocaleKeys.addPostTitle.tr(),
                  style: const TextStyle(
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
                    child: Text(
                      LocaleKeys.postTitle.tr(),
                      style: const TextStyle(
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
                          CustomProfileCashedNetwork(
                            user: widget.user,
                          ),
                          // write a caption
                          CustomTextFieldCaption(
                            captionController: captionController,
                          ),
                        ],
                      ),
                      TextButton(
                        onPressed: () => chooseImage(context),
                        child: Text(
                          LocaleKeys.choosePhotoTile.tr(),
                          style: const TextStyle(
                            color: Colors.blue,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      // post photos
                      imgs!.isNotEmpty
                          ? CustomGridViewPhotos(
                              imgs: imgs,
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
                  log('images is =================== $imgs');
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