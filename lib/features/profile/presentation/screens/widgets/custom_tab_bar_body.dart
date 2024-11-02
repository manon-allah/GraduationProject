import 'package:flutter/material.dart';

import 'custom_tab_bar_view.dart';

class CustomTabBarBody extends StatelessWidget {
  const CustomTabBarBody({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          //////////////////////////////////////
          // Tab bar
          /////////////////////////////////////
          TabBar(
            dividerHeight: 0,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorColor: Colors.white,
            tabs: [
              Tab(
                child: Image.asset(
                  'assets/home/memory.png',
                  width: 24,
                ),
              ),
              Tab(
                child: Image.asset(
                  'assets/home/vedioexploree.png',
                  width: 24,
                ),
              ),
              Tab(
                child: Image.asset(
                  'assets/home/me.png',
                  width: 24,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          //////////////////////////////////////
          // Tab bar view
          /////////////////////////////////////
          const SizedBox(
            height: 300,
            child: TabBarView(
              children: [
                CustomTabBarview(),
                Text('Second page'),
                Text('third page'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
