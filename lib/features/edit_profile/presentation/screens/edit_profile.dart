import 'package:flutter/material.dart';
import 'package:instagram/features/edit_profile/presentation/screens/widgets/custom_edit_profile_body.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xffFAFAFA),
        centerTitle: true,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Cancel',
              style: TextStyle(
                fontSize: 17,
                color: Color(0xFF606060),
              ),
            ),
            Text('Edit Profile'),
            Text(
              'Done',
              style: TextStyle(
                fontSize: 17,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
      body: const CustomEditProfile(),
    );
  }
}
