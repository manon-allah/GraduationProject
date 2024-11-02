import 'package:flutter/material.dart';
import 'package:instagram/features/edit_profile/presentation/screens/widgets/custom_edit_profile_body.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xffFAFAFA),
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
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
            const Text('Edit Profile'),
            InkWell(
              onTap: () {},
              child: const Text(
                'Done',
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.blue,
                ),
              ),
            ),
          ],
        ),
      ),
      body: const CustomEditProfile(),
    );
  }
}
