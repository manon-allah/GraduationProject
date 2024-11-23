import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram/core/functions/pick_image_function.dart';

import 'widgets/custom_add_post_body.dart';

class AddPostScreens extends StatefulWidget {
  const AddPostScreens({super.key});

  @override
  State<AddPostScreens> createState() => _AddPostScreensState();
}

class _AddPostScreensState extends State<AddPostScreens> {
  Uint8List? _image;
  _selectImage(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: const Text('Create a Post'),
            children: [
              SimpleDialogOption(
                padding: const EdgeInsets.all(20),
                child: const Text('Take a Photo'),
                onPressed: () async {
                  GoRouter.of(context).pop();
                  Uint8List image = await selectImage(ImageSource.camera);
                  setState(() {
                    _image = image;
                  });
                },
              ),
              SimpleDialogOption(
                padding: const EdgeInsets.all(20),
                child: const Text('choose from gallary'),
                onPressed: () async {
                  GoRouter.of(context).pop();
                  Uint8List image = await selectImage(ImageSource.gallery);
                  setState(() {
                    _image = image;
                  });
                },
              ),
              SimpleDialogOption(
                padding: const EdgeInsets.all(20),
                child: const Text('Cancel'),
                onPressed: () {
                  GoRouter.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    // final getData = BlocProvider.of<GetDataCubit>(context).addUserModel;
    return Scaffold(
      body: _image == null
          ? Center(
              child: TextButton(
                onPressed: () => _selectImage(context),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Select image',
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
            )
          : CustomAddPostBody(
              imageUrl: _image!,
            ),
    );
  }
}
