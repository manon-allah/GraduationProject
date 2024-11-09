import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class CustomGridView extends StatelessWidget {
  const CustomGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return StaggeredGrid.count(
      crossAxisCount: 3,
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
      children: List.generate(
        19,
        (index) => Container(
          height: index == 2 || index == 11 ? 305 : 150,
          width: 250,
          color: Colors.cyan,
          child: Center(
            child: Text(index == 2 || index == 11 ? 'Reels' : 'Post'),
          ),
        ),
      ),
    );
  }
}
