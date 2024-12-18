import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../../core/functions/show_snake_bar.dart';
import '../../../../domain/entities/profile_entity.dart';
import '../../../manager/cubit/profile_cubit.dart';
import 'app_bar/custom_app_bar_edit_profile.dart';
import 'body/custom_private_info.dart';
import 'body/custom_some_info.dart';
import 'body/custom_text_change_photo.dart';

class CustomEditProfileBody extends StatefulWidget {
  final ProfileEntity user;
  const CustomEditProfileBody({
    super.key,
    required this.user,
  });

  @override
  State<CustomEditProfileBody> createState() => _CustomEditProfileBodyState();
}

class _CustomEditProfileBodyState extends State<CustomEditProfileBody> {
  PlatformFile? imagePickedFile;
  final nameController = TextEditingController();
  final userNameController = TextEditingController();
  final websiteController = TextEditingController();
  final bioController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final genderController = TextEditingController();

  Future<void> pickImage() async {
    final res = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );

    if (res != null) {
      setState(() {
        imagePickedFile = res.files.first;
      });
    }
  }

  void updateProfile() {
    final profileCubit = context.read<ProfileCubit>();

    if (nameController.text.isNotEmpty &&
        userNameController.text.isNotEmpty &&
        websiteController.text.isNotEmpty &&
        bioController.text.isNotEmpty &&
        phoneController.text.isNotEmpty &&
        genderController.text.isNotEmpty &&
        imagePickedFile != null) {
      profileCubit.updateProfile(
        uid: widget.user.uid,
        newName: nameController.text,
        newUserName: userNameController.text,
        newBio: bioController.text,
        newWebsite: websiteController.text,
        newPhone: phoneController.text,
        newGender: genderController.text,
        imagePath: imagePickedFile!.path,
      );
    } else {
      showSnackbar('Please fill all the fields', context);
    }
  }

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

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBarEditProfile(
              onPressed: updateProfile,
            ),
            const SizedBox(
              height: 30,
            ),
            //  photo text change photo
            CustomTextChangePhoto(
              pickImage: pickImage,
              imagePicked: imagePickedFile,
              user: widget.user,
            ),
            const SizedBox(
              height: 15,
            ),
            //  some info
            CustomSomeInfo(
              user: widget.user,
              nameController: nameController,
              userNameController: userNameController,
              websiteController: websiteController,
              bioController: bioController,
            ),
            const SizedBox(
              height: 15,
            ),
            const Divider(
              endIndent: 10,
              indent: 10,
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
            CustomPrivateInfo(
              user: widget.user,
              emailController: emailController,
              phoneController: phoneController,
              genderController: genderController,
            ),
          ],
        ),
      ),
    );
  }
}
