import 'package:flutter/material.dart';
import 'custom_column_text_num.dart';

class CustomPhotoPostsFollowers extends StatelessWidget {
  const CustomPhotoPostsFollowers({
    super.key,
    required this.postLength,
    required this.followers,
    required this.following,
    required this.isFollowing,
    required this.photoUrl,
  });
  final String photoUrl;
  final int postLength;
  final int followers;
  final int following;
  final bool isFollowing;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 48,
          backgroundColor: Colors.red,
          child: CircleAvatar(
            radius: 45,
            backgroundImage: NetworkImage(
              photoUrl,
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomColumnTextNum(
                num: postLength,
                text: 'Posts',
              ),
              CustomColumnTextNum(
                num: followers,
                text: 'Followes',
              ),
              CustomColumnTextNum(
                num: following,
                text: 'Following',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
