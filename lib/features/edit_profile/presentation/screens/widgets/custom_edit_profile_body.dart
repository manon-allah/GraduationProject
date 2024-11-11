import 'package:flutter/material.dart';

import 'custom_text_field.dart';

class CustomEditProfile extends StatefulWidget {
  const CustomEditProfile({super.key});

  @override
  State<CustomEditProfile> createState() => _CustomEditProfileState();
}

class _CustomEditProfileState extends State<CustomEditProfile> {
  TextEditingController nameController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController websiteController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController genderController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    userNameController.dispose();
    websiteController.dispose();
    bioController.dispose();
    emailController.dispose();
    phoneController.dispose();
    genderController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
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
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Change Profile Photo',
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          //  some info
          Column(
            children: [
              CustomTextField(
                controller: nameController,
                text: 'Name',
              ),
              CustomTextField(
                controller: userNameController,
                text: 'UserName',
              ),
              CustomTextField(
                controller: websiteController,
                text: 'Website',
              ),
              CustomTextField(
                controller: bioController,
                text: 'Bio',
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          const Divider(
            endIndent: 15,
          ),
          const SizedBox(
            height: 10,
          ),
          // switch
          const Padding(
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
          const SizedBox(
            height: 30,
          ),
          //  private info
          Column(
            children: [
              CustomTextField(
                controller: emailController,
                text: 'Email',
              ),
              CustomTextField(
                controller: phoneController,
                text: 'Phone',
              ),
              CustomTextField(
                controller: genderController,
                text: 'Gender',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
