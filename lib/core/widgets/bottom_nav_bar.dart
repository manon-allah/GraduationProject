import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/auth/presentation/manager/cubit/auth_cubit.dart';
import '../../features/home/presentation/pages/home_page.dart';
import '../../features/profile/presentation/presentation/pages/profile_page.dart';
import '../../features/search/presentation/presentation/pages/search_page.dart';

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
    final user = context.read<AuthCubit>().currentUser;
    String? uid = user!.uid;
    return Scaffold(
      body: PageView(
        controller: pageController,
        onPageChanged: onPageChanged,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          const HomePage(),
          const SearchPage(),
          // const ExploreScreen(),
          // const ChattingScreen(),
          ProfilePage(
            uid: uid,
          ),
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
              color: _currentIndex == 0
                  ? Theme.of(context).colorScheme.inversePrimary
                  : Theme.of(context).colorScheme.primary,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search_rounded,
              color: _currentIndex == 1
                  ? Theme.of(context).colorScheme.inversePrimary
                  : Theme.of(context).colorScheme.primary,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/vedioexploree.png',
              color: _currentIndex == 2
                  ? Theme.of(context).colorScheme.inversePrimary
                  : Theme.of(context).colorScheme.primary,
              width: 22,
            ),
            label: '', 
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/bagshop.png',
              color: _currentIndex == 3
                  ? Theme.of(context).colorScheme.inversePrimary
                  : Theme.of(context).colorScheme.primary,
              width: 22,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: _currentIndex == 4
                  ? Theme.of(context).colorScheme.inversePrimary
                  : Theme.of(context).colorScheme.primary,
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
