import 'package:flutter/material.dart';
import 'package:instagram/features/bottom_nav_bar/presentation/screens/chatting_screen.dart';
import 'package:instagram/features/bottom_nav_bar/presentation/screens/explore_screen.dart';
import 'package:instagram/features/home/presentation/screens/home_screen.dart';
import 'package:instagram/features/profile/presentation/screens/profile_screen.dart';
import 'package:instagram/features/bottom_nav_bar/presentation/screens/search_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

int _currentIndex = 0;

class _BottomNavBarState extends State<BottomNavBar> {
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  onPageChanged(int pageNumber) {
    setState(() {
      _currentIndex = pageNumber;
    });
  }

  navigationTapped(int pageNum) {
    pageController.jumpToPage(pageNum);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: navigationTapped,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: '',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.search_rounded),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/home/vedioexploree.png',
              width: 22,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/home/bagshop.png',
              width: 22,
            ),
            label: '',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '',
          ),
        ],
      ),
      body: PageView(
        controller: pageController,
        onPageChanged: onPageChanged,
        // physics: const BouncingScrollPhysics(),
        children: const [
          HomeScreen(),
          SearchScreen(),
          ExploreScreen(),
          ChattingScreen(),
          ProfileScreen(),
        ],
      ),
    );
  }
}
