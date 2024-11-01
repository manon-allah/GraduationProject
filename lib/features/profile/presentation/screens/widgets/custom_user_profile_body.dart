import 'package:flutter/material.dart';
import 'package:instagram/features/profile/presentation/screens/widgets/custom_column_text_num.dart';
import 'package:instagram/features/profile/presentation/screens/widgets/custom_tab_bar_view.dart';

class CustomUserProfileBody extends StatelessWidget {
  const CustomUserProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /////////////////////////////////////////////
          // photo and number of posts.....etc
          /////////////////////////////////////////////
          const Padding(
            padding: EdgeInsets.only(
              left: 15,
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 48,
                  backgroundColor: Colors.red,
                  child: CircleAvatar(
                    radius: 45,
                    backgroundImage: AssetImage('assets/posts/2.jpeg'),
                  ),
                ),
                SizedBox(
                  width: 90,
                ),
                Row(
                  children: [
                    CustomColumnTextNum(
                      num: '1,234',
                      text: 'Posts',
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    CustomColumnTextNum(
                      num: '5,678',
                      text: 'Followes',
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    CustomColumnTextNum(
                      num: '9,101',
                      text: 'Following',
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ////////////////////////////////////////////
          // user name button edit....etc
          ///////////////////////////////////////////
          Padding(
            padding: const EdgeInsets.only(
              left: 13,
            ),
            child: Column(
              children: [
                ////////////////////////////////////////////
                // user name and some information....etc
                ///////////////////////////////////////////
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'username',
                      style: TextStyle(
                        fontSize: 24,
                      ),
                    ),
                    Text(
                      'Category/Genre text',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt #hashtag'),
                    Text(
                      'Link gose here',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                ///////////////////////////////////////
                // followed by
                //////////////////////////////////////
                const Row(
                  children: [
                    SizedBox(
                      width: 100,
                      child: Stack(
                        // textDirection: TextDirection.ltr,
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundImage: AssetImage('assets/posts/2.jpeg'),
                          ),
                          Positioned(
                            left: 20,
                            child: CircleAvatar(
                              radius: 20,
                              backgroundImage:
                                  AssetImage('assets/posts/3.jpeg'),
                            ),
                          ),
                          Positioned(
                            left: 40,
                            child: CircleAvatar(
                              radius: 20,
                              backgroundImage:
                                  AssetImage('assets/posts/4.jpeg'),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text('Followed by '),
                            Text(
                              'username,username',
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ],
                        ),
                        Text('and 100 others'),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                //////////////////////////////////////
                // button edit profile
                /////////////////////////////////////
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, 'edit_profile');
                      },
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        width: MediaQuery.of(context).size.width - 70,
                        color: const Color(0xffEFEFEF),
                        child: const Center(
                          child: Text(
                            'Edit profile',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Container(
                      padding: const EdgeInsets.all(5),
                      width: 40,
                      color: const Color(0xffEFEFEF),
                      child: Center(
                        child: Image.asset(
                          'assets/home/personadd.png',
                          width: 23,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                //////////////////////////////////////
                // list view story
                /////////////////////////////////////
                SizedBox(
                  height: 80,
                  child: ListView.builder(
                    itemCount: 10,
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return const Padding(
                        padding: EdgeInsets.only(
                          right: 15,
                        ),
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 28,
                              backgroundColor: Colors.red,
                              child: CircleAvatar(
                                radius: 25,
                                backgroundImage:
                                    AssetImage('assets/posts/2.jpeg'),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text('Text here')
                          ],
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
          //////////////////////////////////////
          // Tab bar
          /////////////////////////////////////
          TabBar(
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
          // const SizedBox(
          //   height: 15,
          // ),
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
