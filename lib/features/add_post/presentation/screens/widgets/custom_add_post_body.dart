import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:instagram/constants.dart';
import 'package:instagram/core/functions/snack_bar_function.dart';
import 'package:instagram/features/add_post/presentation/manager/cubit/add_post_cubit.dart';
import 'package:instagram/features/profile/presentation/manager/cubit/get_data_cubit.dart';

class CustomAddPostBody extends StatefulWidget {
  const CustomAddPostBody({super.key, required this.imageUrl});
  final Uint8List imageUrl;

  @override
  State<CustomAddPostBody> createState() => _CustomAddPostBodyState();
}

class _CustomAddPostBodyState extends State<CustomAddPostBody> {
  TextEditingController captionController = TextEditingController();
  bool isLoading = false;

  @override
  void dispose() {
    super.dispose();
    captionController.dispose();
  }

  // void clearImage() {
  //   setState(() {
  //     widget.imageUrl = null;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    final getData = BlocProvider.of<GetDataCubit>(context).addUserModel;
    return BlocConsumer<AddPostCubit, AddPostState>(
      listener: (context, state) {
        if (state is AddPostSuccess) {
          setState(() {
            isLoading = false;
          });
          showSnackbar('Posted Success', context);
          GoRouter.of(context).pop();
        } else {
          showSnackbar('some error occured', context);
        }
      },
      builder: (context, state) {
        final addPostCubit = context.read<AddPostCubit>();
        return SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                // app bar
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        GoRouter.of(context).pop();
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
                        onPressed: () {
                          setState(() {
                            isLoading = true;
                          });
                          addPostCubit.addPost(
                            description: captionController.text,
                            img: widget.imageUrl,
                            uid: auth.currentUser!.uid,
                            userName: getData?.userName ?? 'UserName',
                            profileImage: getData?.imageUrl ?? imageUrlOnline,
                          );
                        },
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
                    isLoading
                        ? const LinearProgressIndicator(
                            color: Colors.blue,
                          )
                        : const SizedBox(),
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
                                CircleAvatar(
                                  radius: 30,
                                  backgroundImage: NetworkImage(
                                      getData?.imageUrl ?? imageUrlOnline),
                                ),
                                // write a caption
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.7,
                                  child: TextField(
                                    controller: captionController,
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Write a caption...',
                                    ),
                                    maxLines: 8,
                                  ),
                                ),
                              ]),
                          // post photo
                          SizedBox(
                            width: 400,
                            height: 400,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                image: DecorationImage(
                                  image: MemoryImage(widget.imageUrl),
                                  fit: BoxFit.fill,
                                  alignment: FractionalOffset.topCenter,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
    // const Center(
    //   child: Text('Add Post'),
    // );
  }
}
