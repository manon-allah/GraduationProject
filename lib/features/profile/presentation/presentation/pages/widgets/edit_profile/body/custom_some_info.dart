import 'package:flutter/material.dart';
import '../../../../../domain/entities/profile_entity.dart';
import 'custom_text_field_edit_profile.dart';

class CustomSomeInfo extends StatelessWidget {
  final ProfileEntity user;
  const CustomSomeInfo({
    super.key,
    required this.nameController,
    required this.userNameController,
    required this.websiteController,
    required this.bioController,
    required this.user,
  });

  final TextEditingController nameController;
  final TextEditingController userNameController;
  final TextEditingController websiteController;
  final TextEditingController bioController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFieldEditProfile(
          text: 'Name',
          controller: nameController,
          hint: user.name,
        ),
        CustomTextFieldEditProfile(
          text: 'UserName',
          controller: userNameController,
          hint: user.userName,
        ),
        CustomTextFieldEditProfile(
          text: 'Website',
          controller: websiteController,
          hint: user.website,
        ),
        CustomTextFieldEditProfile(
          text: 'Bio',
          controller: bioController,
          hint: user.bio,
        ),
      ],
    );
  }
}
