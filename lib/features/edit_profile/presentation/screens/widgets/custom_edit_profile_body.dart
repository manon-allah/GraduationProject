import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram/core/functions/pick_image_function.dart';
import 'package:instagram/core/functions/snack_bar_function.dart';
import 'package:instagram/features/edit_profile/presentation/manager/cubit/add_user_data_cubit.dart';

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
    return BlocConsumer<AddUserDataCubit, AddUserDataState>(
      listener: (context, state) {
        if (state is AddUserDataSuccess) {
          GoRouter.of(context).pop();
        } else {
          showSnackbar('Something wrong', context);
        }
      },
      builder: (context, state) {
        final addDataCubit = context.read<AddUserDataCubit>();
        return SingleChildScrollView(
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        GoRouter.of(context).pop();
                      },
                      child: const Text(
                        'Cancel',
                        style: TextStyle(
                          fontSize: 17,
                          color: Color(0xFF606060),
                        ),
                      ),
                    ),
                    const Text(
                      'Edit Profile',
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        addDataCubit.addUserData(
                          name: nameController.text,
                          userName: userNameController.text,
                          website: websiteController.text,
                          bio: bioController.text,
                          email: emailController.text,
                          phone: phoneController.text,
                          gender: genderController.text,
                          photoUrl: _image!,
                        );
                      },
                      child: const Text(
                        'Done',
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
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
                              radius: 70,
                              backgroundImage: MemoryImage(_image!),
                            )
                          : const CircleAvatar(
                              radius: 70,
                              backgroundImage: NetworkImage(
                                  'https://static-00.iconduck.com/assets.00/profile-icon-2048x2048-yj5zf8da.png'),
                            ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextButton(
                      onPressed: () {
                        
                      },
                      child: const Text(
                        'Change Profile Photo',
                        style: TextStyle(
                          color: Colors.blue,
                        ),
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
          ),
        );
      },
    );
  }
}
