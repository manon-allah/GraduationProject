import 'package:flutter/material.dart';

import '../../../chatting/presentation/screens/widgets/custom_search_bar.dart';

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
          child: CustomSearchBar(),
        ),
      ],
    );
  }
}
