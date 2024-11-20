import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_router.dart';

class CustomUserNameEdit extends StatelessWidget {
  const CustomUserNameEdit({
    super.key,
    required this.userData,
  });
  final Map<String, dynamic> userData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ////////////////////////////////////////////
        // user name and some information....etc
        ///////////////////////////////////////////
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              userData['userName'] ?? 'username',
              style: const TextStyle(
                fontSize: 24,
              ),
            ),
            Text(
              userData['bio'] ?? 'bio',
              style: const TextStyle(
                fontSize: 20,
                color: Colors.grey,
              ),
            ),
            const Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt #hashtag'),
            TextButton(
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
              ),
              onPressed: () {},
              child: Text(
                userData['website'] ?? 'Website',
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.blue,
                ),
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
                children: [
                  Positioned(
                    left: 40,
                    child: CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage('assets/posts/4.jpeg'),
                    ),
                  ),
                  Positioned(
                    left: 20,
                    child: CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage('assets/posts/3.jpeg'),
                    ),
                  ),
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage('assets/posts/2.jpeg'),
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
                GoRouter.of(context).pushNamed(AppRouter.kEditScreen);
              },
              child: Container(
                padding: const EdgeInsets.all(5),
                width: MediaQuery.of(context).size.width - 70,
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
            // InkWell(
            //   onTap: () {},
            //   child: Container(
            //     padding: const EdgeInsets.all(5),
            //     width: MediaQuery.of(context).size.width - 70,
            //     child: const Center(
            //       child: Text(
            //         'UnFollow',
            //         style: TextStyle(
            //           fontSize: 18,
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            // InkWell(
            //   onTap: () {},
            //   child: Container(
            //     padding: const EdgeInsets.all(5),
            //     color: Colors.blue,
            //     width: MediaQuery.of(context).size.width - 70,
            //     child: const Center(
            //       child: Text(
            //         'Follow',
            //         style: TextStyle(
            //           fontSize: 20,
            //           color: Colors.white,
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            const SizedBox(
              width: 5,
            ),
            const Icon(Icons.person_add),
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
                        backgroundImage: AssetImage('assets/posts/2.jpeg'),
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
    );
  }
}
