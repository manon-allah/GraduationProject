import 'package:flutter/material.dart';
import 'package:instagram/features/edit_profile/presentation/screens/widgets/custom_private_info.dart';

import 'custom_change_photo.dart';
import 'custom_user_info.dart';

class CustomEditProfile extends StatelessWidget {
  const CustomEditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 30,
          ),
          //  photo text change photo
          CustomChangePhoto(),
          SizedBox(
            height: 15,
          ),
          //  some info
          CustomUserInfo(),
          SizedBox(
            height: 15,
          ),
          Divider(
            endIndent: 15,
          ),
          SizedBox(
            height: 10,
          ),
          // switch
          Padding(
            padding: EdgeInsets.only(
              left: 15,
            ),
            child: Text(
              'Switch to Professional Account',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 17,
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          //  private info
          CustomPrivateInfo(),
        ],
      ),
    );
  }
}
