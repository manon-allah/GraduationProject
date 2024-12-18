import 'package:flutter/material.dart';
import '../../../../../domain/entities/profile_entity.dart';
import 'custom_text_field_edit_profile.dart';

class CustomPrivateInfo extends StatelessWidget {
  final ProfileEntity user;
  const CustomPrivateInfo({
    super.key,
    required this.emailController,
    required this.phoneController,
    required this.genderController,
    required this.user,
  });

  final TextEditingController emailController;
  final TextEditingController phoneController;
  final TextEditingController genderController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFieldEditProfile(
          text: 'Email',
          controller: emailController,
          hint: user.email,
        ),
        CustomTextFieldEditProfile(
          text: 'Phone',
          controller: phoneController,
          hint: user.phone,
        ),
        CustomTextFieldEditProfile(
          text: 'Gender',
          controller: genderController,
          hint: user.gender,
        ),
      ],
    );
  }
}
