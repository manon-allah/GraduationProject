import 'package:flutter/material.dart';
import 'package:instagram/features/auth/domain/entities/user_entity.dart';
import '../../../../../domain/entities/profile_entity.dart';
import '../list_view_story_profile/custom_list_view_story_profile.dart';
import 'custom_button_edit_profile.dart';
import 'custom_followed_by_profile.dart';
import 'custom_user_name_some_information.dart';

class CustomUserNameEdit extends StatelessWidget {
  final UserEntity currentUid;
  final String userProfile;
  final bool isFollowing;
  final ProfileEntity user;
  final void Function()? onTap;
  const CustomUserNameEdit({
    super.key,
    required this.user,
    required this.isFollowing,
    required this.onTap,
    required this.currentUid,
    required this.userProfile,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // user name and some information....etc
        CustomUserNameSomeInformation(
          user: user,
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
        CustomButtonEditProfile(
          currentUid: currentUid,
          userProfile: userProfile,
          onTap: onTap,
          user: user,
          isFollowing: isFollowing,
        ),
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
