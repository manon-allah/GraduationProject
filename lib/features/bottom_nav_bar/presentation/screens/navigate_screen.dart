import 'package:flutter/material.dart';
import 'package:instagram/features/chatting/presentation/screens/chatting_screen.dart';
import 'package:instagram/features/bottom_nav_bar/presentation/screens/explore_screen.dart';
import 'package:instagram/features/home/presentation/screens/home_screen.dart';
import 'package:instagram/features/profile/presentation/screens/profile_screen.dart';
import 'package:instagram/features/search/presentation/screens/search_screen.dart';

class NavigateScreen extends StatefulWidget {
  const NavigateScreen({super.key});

  @override
  State<NavigateScreen> createState() => _NavigateScreenState();
}

int _currentIndex = 0;

class _NavigateScreenState extends State<NavigateScreen> {
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
      body: PageView(
        controller: pageController,
        onPageChanged: onPageChanged,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          HomeScreen(),
          SearchScreen(),
          ExploreScreen(),
          ChattingScreen(),
          ProfileScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: navigationTapped,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_rounded,
              color: _currentIndex == 0 ? Colors.black : Colors.grey,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_rounded,
                color: _currentIndex == 1 ? Colors.black : Colors.grey),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/home/vedioexploree.png',
              color: _currentIndex == 2 ? Colors.black : Colors.grey,
              width: 22,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/home/bagshop.png',
              color: _currentIndex == 3 ? Colors.black : Colors.grey,
              width: 22,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: _currentIndex == 4 ? Colors.black : Colors.grey,
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
