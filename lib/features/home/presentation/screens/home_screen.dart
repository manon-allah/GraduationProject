import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram/features/home/presentation/screens/widgets/posts/custom_post_body.dart';
import 'package:instagram/features/home/presentation/screens/widgets/story/stories_list_view_body.dart';
import 'package:instagram/features/setting/presentation/manager/switch/switch_cubit.dart';

import 'widgets/app_bar/custom_app_bar_home.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SwitchCubit, SwitchState>(
      listener: (context, state) {},
      builder: (context, state) {
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
      },
    );
  }
}
