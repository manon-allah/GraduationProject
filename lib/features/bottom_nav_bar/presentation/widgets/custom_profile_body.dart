import 'package:flutter/material.dart';
import 'package:instagram/features/bottom_nav_bar/presentation/widgets/custom_user_profile_body.dart';

class CustomProfileBody extends StatelessWidget {
  const CustomProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CustomUserProfileBody(),
        
      ],
    );
  }
}
