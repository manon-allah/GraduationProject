import 'package:flutter/material.dart';

class CustomEditProfile extends StatelessWidget {
  const CustomEditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(
          height: 20,
        ),
        //////////////////////////////////////////////
        //  photo text change photo 
        /////////////////////////////////////////////
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
        
      ],
    );
  }
}
