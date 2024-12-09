import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CustomTabBarview extends StatelessWidget {
  const CustomTabBarview({
    super.key,
    required this.posts,
  });
  final List<QueryDocumentSnapshot> posts;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: posts.length,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 1,
        crossAxisSpacing: 1,
      ),
      itemBuilder: (context, index) {
        return Image.network(
          posts[index]['postUrl'],
          fit: BoxFit.fill,
        );
      },
    );
  }
}
