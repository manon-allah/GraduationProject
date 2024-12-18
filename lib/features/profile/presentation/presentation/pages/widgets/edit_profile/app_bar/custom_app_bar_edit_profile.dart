import 'package:flutter/material.dart';

class CustomAppBarEditProfile extends StatelessWidget {
  final void Function()? onPressed;
  const CustomAppBarEditProfile({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text(
            'Cancel',
            style: TextStyle(
              fontSize: 17,
              color: Color(0xFF606060),
            ),
          ),
        ),
        const Text(
          'Edit Profile',
          style: TextStyle(
            fontSize: 25,
          ),
        ),
        TextButton(
          onPressed: onPressed,
          // () {
          //   // addDataCubit.addUserData(
          //   //   name: nameController.text,
          //   //   userName: userNameController.text,
          //   //   website: websiteController.text,
          //   //   bio: bioController.text,
          //   //   email: emailController.text,
          //   //   phone: phoneController.text,
          //   //   gender: genderController.text,
          //   //   photoUrl: _image!,
          //   // );
          // },
          child: const Text(
            'Done',
            style: TextStyle(
              fontSize: 17,
              color: Colors.blue,
            ),
          ),
        ),
      ],
    );
  }
}
