import 'package:flutter/material.dart';
import 'custom_button_edit_profile.dart';
import 'custom_followed_by_profile.dart';
import 'custom_list_view_story_profile.dart';
import 'custom_user_name_some_information.dart';

class CustomUserNameEdit extends StatelessWidget {
  const CustomUserNameEdit({
    super.key,
    required this.userData,
  });
  final Map<String, dynamic> userData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // user name and some information....etc
        CustomUserNameSomeInformation(
          userData: userData,
        ),
        const SizedBox(
          height: 10,
        ),
        // followed by
        const CustomFollowedByProfile(),
        const SizedBox(
          height: 10,
        ),
        // button edit profile
        const CustomButtonEditProfile(),
        const SizedBox(
          height: 15,
        ),
        // list view story
        const CustomListViewStoryProfile(),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
