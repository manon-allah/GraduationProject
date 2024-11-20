import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import 'custom_column_text_num.dart';

class CustomPhotoPostsFollowers extends StatelessWidget {
  const CustomPhotoPostsFollowers({super.key});

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
              imageUrlOnline,
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomColumnTextNum(
                num: 10,
                text: 'Posts',
              ),
              CustomColumnTextNum(
                num: 10,
                text: 'Followes',
              ),
              CustomColumnTextNum(
                num: 10,
                text: 'Following',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
