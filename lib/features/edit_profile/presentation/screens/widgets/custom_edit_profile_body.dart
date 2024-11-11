import 'package:flutter/material.dart';

import 'custom_text_field.dart';

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
          Column(
            children: [
              Align(
                alignment: Alignment.center,
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/posts/2.jpeg'),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Change Profile Photo',
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          //  some info
          const Column(
            children: [
              CustomTextField(
                text: 'Name',
              ),
              CustomTextField(
                text: 'UserName',
              ),
              CustomTextField(
                text: 'Website',
              ),
              CustomTextField(
                text: 'Bio',
              ),
            ],
          ),
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
          const Column(
            children: [
              CustomTextField(
                text: 'Email',
              ),
              CustomTextField(
                text: 'Phone',
              ),
              CustomTextField(
                text: 'Gender',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
