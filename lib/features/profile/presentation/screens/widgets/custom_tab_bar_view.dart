import 'package:flutter/material.dart';

class CustomTabBarview extends StatelessWidget {
  const CustomTabBarview({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 10,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 1,
        crossAxisSpacing: 1,
      ),
      itemBuilder: (context, index) {
        
        return Image.asset(
          'assets/posts/2.jpeg',
          fit: BoxFit.fill,
        );
        // const CustomMediaGrid();
      },
    );
  }
}
