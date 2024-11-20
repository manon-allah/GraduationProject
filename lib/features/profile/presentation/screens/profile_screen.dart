import 'package:flutter/material.dart';
import 'widgets/custom_profile_body.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    super.key,
    required this.uId,
  });
  final String uId;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomProfileBody(),
    );
  }
}
