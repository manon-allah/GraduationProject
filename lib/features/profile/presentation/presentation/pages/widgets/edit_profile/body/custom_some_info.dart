import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../../../../../lang/locale_keys.g.dart';
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
          text: LocaleKeys.nameTitle.tr(),
          controller: nameController,
          hint: user.name,
        ),
        CustomTextFieldEditProfile(
          text: LocaleKeys.userNameTitle.tr(),
          controller: userNameController,
          hint: user.userName,
        ),
        CustomTextFieldEditProfile(
          text: LocaleKeys.WebsiteTitle.tr(),
          controller: websiteController,
          hint: user.website,
        ),
        CustomTextFieldEditProfile(
          text: LocaleKeys.BioTitle.tr(),
          controller: bioController,
          hint: user.bio,
        ),
      ],
    );
  }
}
