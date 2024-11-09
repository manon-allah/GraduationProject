import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 15,
        right: 15,
        bottom: 20,
      ),
      child: TextField(
        decoration: InputDecoration(
          // filled: true,
          // fillColor: const Color(0xFFD9D9D9),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
          hintText: 'Search',
          prefixIcon: const Icon(
            Icons.search,
            size: 18,
          ),
        ),
      ),
    );
  }
}
