import 'package:flutter/material.dart';
import 'package:instagram/features/edit_profile/presentation/screens/widgets/custom_edit_profile_body.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomEditProfile(),
    );
  }
}
