import 'package:flutter/material.dart';

import 'widgets/custom_app_bar_chat.dart';
import 'widgets/custom_list_tile_chat.dart';
import 'widgets/custom_row_text.dart';
import 'widgets/custom_search_bar.dart';

class ChattingScreen extends StatefulWidget {
  const ChattingScreen({super.key});

  @override
  State<ChattingScreen> createState() => _ChattingScreenState();
}

class _ChattingScreenState extends State<ChattingScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(
          child: CustomAppBarChat(),
        ),
        const SliverToBoxAdapter(
          child: CustomSearchBar(),
        ),
        const SliverToBoxAdapter(
          child: CustomRowText(),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: 20,
            (context, index) {
              return const CustomListTileChat();
            },
          ),
        ),
      ],
    );
  }
}
