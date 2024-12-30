import 'package:flutter/material.dart';
import 'package:instagram/features/auth/domain/entities/user_entity.dart';
import '../../../domain/entities/profile_entity.dart';
import 'profile/app_bar/custom_app_bar_profile.dart';
import 'profile/photo_posts_followers/custom_photo_posts_followers.dart';
import 'profile/tab_bar/custom_tab_bar_body.dart';
import 'profile/user_name_edit/custom_user_name_edit.dart';

class CustomProfileBody extends StatelessWidget {
  final bool isOwn;
  final int followersCount;
  final int followingCount;
  final UserEntity currentUid;
  final bool isFollowing;
  final void Function()? onTap;
  final String uid;
  final ProfileEntity profile;
  const CustomProfileBody({
    super.key,
    required this.profile,
    required this.uid,
    required this.isFollowing,
    required this.onTap,
    required this.currentUid,
    required this.followersCount,
    required this.followingCount, required this.isOwn,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // app bar
                  CustomAppBarProfile(
                    isOwn: isOwn,
                    user: profile,
                  ),
                  // photo and number of posts.....etc
                  CustomPhotoPostsFollowers(
                    uId: uid,
                    followersCount: followersCount,
                    followingCount: followingCount,
                    user: profile,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  // user name button edit....etc
                  CustomUserNameEdit(
                    currentUid: currentUid,
                    userProfile: uid,
                    isFollowing: isFollowing,
                    onTap: onTap,
                    user: profile,
                  ),
                ],
              ),
            ),
          ),
          SliverFillRemaining(
            child: Column(
              children: [
                Expanded(
                  child: CustomTabBarBody(
                    uid: uid,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
