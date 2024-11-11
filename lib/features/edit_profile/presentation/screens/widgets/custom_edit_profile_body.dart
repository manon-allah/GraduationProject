import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram/core/functions/pick_image_function.dart';

import 'custom_text_field.dart';

class CustomEditProfile extends StatefulWidget {
  const CustomEditProfile({super.key});

  @override
  State<CustomEditProfile> createState() => _CustomEditProfileState();
}

class _CustomEditProfileState extends State<CustomEditProfile> {
  TextEditingController nameController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController websiteController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  Uint8List? _image;

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    userNameController.dispose();
    websiteController.dispose();
    bioController.dispose();
    emailController.dispose();
    phoneController.dispose();
    genderController.dispose();
  }

  // pick image
  void chooseImage() async {
    Uint8List image = selectImage(ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 30,
          ),
          //  photo text change photo
          Column(
            children: [
              Align(
                alignment: Alignment.center,
                child: _image != null
                    ? CircleAvatar(
                        radius: 50,
                        backgroundImage: MemoryImage(_image!),
                      )
                    : const CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(
                            'data:image/png;base64,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'),
                      ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Change Profile Photo',
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          //  some info
          Column(
            children: [
              CustomTextField(
                controller: nameController,
                text: 'Name',
              ),
              CustomTextField(
                controller: userNameController,
                text: 'UserName',
              ),
              CustomTextField(
                controller: websiteController,
                text: 'Website',
              ),
              CustomTextField(
                controller: bioController,
                text: 'Bio',
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          const Divider(
            endIndent: 15,
          ),
          const SizedBox(
            height: 10,
          ),
          // switch
          const Padding(
            padding: EdgeInsets.only(
              left: 15,
            ),
            child: Text(
              'Switch to Professional Account',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 17,
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          //  private info
          Column(
            children: [
              CustomTextField(
                controller: emailController,
                text: 'Email',
              ),
              CustomTextField(
                controller: phoneController,
                text: 'Phone',
              ),
              CustomTextField(
                controller: genderController,
                text: 'Gender',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
