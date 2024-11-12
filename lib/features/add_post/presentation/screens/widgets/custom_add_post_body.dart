import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:instagram/constants.dart';
import 'package:instagram/features/profile/presentation/manager/cubit/get_data_cubit.dart';

class CustomAddPostBody extends StatefulWidget {
  const CustomAddPostBody({super.key, required this.imageUrl});
  final Uint8List imageUrl;

  @override
  State<CustomAddPostBody> createState() => _CustomAddPostBodyState();
}

class _CustomAddPostBodyState extends State<CustomAddPostBody> {
  TextEditingController captionController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    captionController.dispose();
  }

  void postPost(){

  }

  @override
  Widget build(BuildContext context) {
    final getData = BlocProvider.of<GetDataCubit>(context).addUserModel;
    return SafeArea(
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
                  onPressed: postPost,
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
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
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
                        backgroundImage:
                            NetworkImage(getData?.imageUrl ?? imageUrlOnline),
                      ),
                      // write a caption
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: TextField(
                          controller: captionController,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Write a caption...',
                          ),
                          maxLines: 8,
                        ),
                      ),
                      // post photo
                      SizedBox(
                        width: 45,
                        height: 45,
                        child: AspectRatio(
                          aspectRatio: 480 / 450,
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: MemoryImage(widget.imageUrl),
                                fit: BoxFit.fill,
                                alignment: FractionalOffset.topCenter,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ]),
              ],
            ),
          ),
        ],
      ),
    );
    // const Center(
    //   child: Text('Add Post'),
    // );
  }
}
