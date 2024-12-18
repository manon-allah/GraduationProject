import 'package:flutter/material.dart';

import 'custom_tab_bar_view.dart';

class CustomTabBarBody extends StatelessWidget {
  final String uid;
  const CustomTabBarBody({
    super.key,
    required this.uid,
  });

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
                  'assets/memory.png',
                  width: 24,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
              Tab(
                child: Image.asset(
                  'assets/vedioexploree.png',
                  width: 24,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
              Tab(
                child: Image.asset(
                  'assets/me.png',
                  width: 24,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
            ],
          ),
          //////////////////////////////////////
          // Tab bar view
          /////////////////////////////////////
          Expanded(
            child: TabBarView(
              children: [
                CustomTabBarView(
                  uid: uid,
                ),
                const Text('Second page'),
                const Text('third page'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
