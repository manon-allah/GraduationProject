import 'package:flutter/material.dart';

import 'custom_change_photo.dart';

class CustomEditProfile extends StatelessWidget {
  const CustomEditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(
          height: 20,
        ),
        //  photo text change photo 
        CustomChangePhoto(),
        
      ],
    );
  }
}
