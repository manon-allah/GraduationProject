import 'package:flutter/material.dart';
import 'package:instagram/features/bottom_nav_bar/presentation/widgets/bottom_nav_bar.dart';

class NavigateScreen extends StatelessWidget {
  const NavigateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BottomNavBar(),
    );
  }
}