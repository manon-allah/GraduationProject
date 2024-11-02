import 'package:flutter/material.dart';
import 'package:instagram/features/home/presentation/screens/widgets/posts/custom_post_body.dart';
import 'package:instagram/features/home/presentation/screens/widgets/story/stories_list_view_body.dart';

import 'widgets/app_bar/custom_app_bar_home.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(
          child: CustomAppBarHome(),
        ),
        const SliverToBoxAdapter(
          child: StoriesListViewBody(),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: 10,
            (context, index) {
              return const CustomPostBody();
            },
          ),
        ),
      ],
    );
  }
}
