import 'package:flutter/material.dart';

import '../../../../chatting/presentation/screens/widgets/custom_search_bar.dart';
import 'custom_grid_view.dart';

class CustomSearchBody extends StatelessWidget {
  const CustomSearchBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CustomSearchBar(),
        CustomGridView(),
      ],
    );
  }
}