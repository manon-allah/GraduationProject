import 'package:flutter/material.dart';
import 'package:instagram/features/profile/presentation/screens/widgets/custom_profile_body.dart';

import 'widgets/custom_app_bar_profile.dart';
import 'widgets/custom_tab_bar_body.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(
          child: CustomAppBarProfile(),
        ),
        const SliverToBoxAdapter(
          child: CustomProfileBody(),
        ),
        const SliverToBoxAdapter(
          child: CustomTabBarBody(),
        ),
        // SliverList(
        //   delegate: SliverChildBuilderDelegate(
        //     childCount: 10,
        //     (context, index) {
        //       return const CustomPostBody();
        //     },
        //   ),
        // ),
      ],
    );
  }
}
