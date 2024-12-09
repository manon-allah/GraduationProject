import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'custom_app_bar_profile.dart';
import 'custom_photo_posts_followers.dart';
import 'custom_tab_bar_body.dart';
import 'custom_user_name_edit.dart';

class CustomProfileBody extends StatelessWidget {
  const CustomProfileBody({
    super.key,
    required this.userData,
    required this.postLength,
    required this.followers,
    required this.following,
    required this.isFollowing,
    required this.posts,
    required this.uId,
  });
  final Map<String, dynamic> userData;
  final List<QueryDocumentSnapshot> posts;
  final String uId;
  final int postLength;
  final int followers;
  final int following;
  final bool isFollowing;

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
                    userName: userData['userName'],
                  ),
                  // photo and number of posts.....etc
                  CustomPhotoPostsFollowers(
                    postLength: postLength,
                    followers: followers,
                    following: following,
                    isFollowing: isFollowing,
                    photoUrl: userData['imageUrl'],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  // user name button edit....etc
                  CustomUserNameEdit(
                    isFollowing: isFollowing,
                    uId: uId,
                    userData: userData,
                    followers: followers,
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
                    posts: posts,
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
