import 'package:flutter/material.dart';

import 'widgets/custom_search_body.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: SizedBox(
            height: 55,
          ),
        ),
        SliverToBoxAdapter(
          child: CustomSearchBody(),
        ),
      ],
    );
  }
}
