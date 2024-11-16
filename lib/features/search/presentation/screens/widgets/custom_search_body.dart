import 'package:flutter/material.dart';

import 'custom_grid_view.dart';

class CustomSearchBody extends StatefulWidget {
  const CustomSearchBody({super.key});

  @override
  State<CustomSearchBody> createState() => _CustomSearchBodyState();
}

class _CustomSearchBodyState extends State<CustomSearchBody> {
  

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          

          CustomGridView(),
        ],
      ),
    );
  }
}
