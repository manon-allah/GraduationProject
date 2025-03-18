import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../../../../../lang/locale_keys.g.dart';
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
          text: LocaleKeys.emailTitle.tr(),
          controller: emailController,
          hint: user.email,
        ),
        CustomTextFieldEditProfile(
          text: LocaleKeys.phoneTitle.tr(),
          controller: phoneController,
          hint: user.phone,
        ),
        CustomTextFieldEditProfile(
          text: LocaleKeys.genderTitle.tr(),
          controller: genderController,
          hint: user.gender,
        ),
      ],
    );
  }
}
