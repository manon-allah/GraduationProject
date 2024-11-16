import 'package:flutter/material.dart';
import 'package:instagram/features/profile/presentation/screens/widgets/custom_profile_body.dart';

import 'widgets/custom_app_bar_profile.dart';
import 'widgets/custom_tab_bar_body.dart';

class NewFollowerScreen extends StatefulWidget {
  const NewFollowerScreen({super.key});

  @override
  State<NewFollowerScreen> createState() => _NewFollowerScreenState();
}

class _NewFollowerScreenState extends State<NewFollowerScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: CustomAppBarProfile(),
          ),
          SliverToBoxAdapter(
            child: CustomProfileBody(),
          ),
          SliverToBoxAdapter(
            child: CustomTabBarBody(),
          ),
        ],
      ),
    );
  }
}
