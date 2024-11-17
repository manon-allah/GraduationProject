import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../constants.dart';
import '../../../../core/utils/app_router.dart';
import 'widgets/custom_column_text_num.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({
    super.key,
    required this.uId,
  });
  final String uId;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var userData = {};
  int postLength = 0;
  int followers = 0;
  int following = 0;
  bool isFollowing = false;

  @override
  void initState() {
    super.initState();
    getPostsLength();
  }

  getPostsLength() async {
    var userSnap = await FirebaseFirestore.instance
        .collection('users')
        .doc(widget.uId)
        .get();
    var postSnap = await FirebaseFirestore.instance
        .collection('posts')
        .where('uId', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();
    userData = userSnap.data()!;
    postLength = postSnap.docs.length;
    followers = userSnap.data()!['flowers'].length;
    following = userSnap.data()!['following'].length;
    isFollowing = userSnap
        .data()!['flowers']
        .contains(FirebaseAuth.instance.currentUser!.uid);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ////////////////////////////////////////////////////
              // app bar
              ///////////////////////////////////////////////////
              Row(
                children: [
                  Text(
                    userData['userName'] ?? 'UserName',
                    style: const TextStyle(
                      fontSize: 27,
                    ),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      const Icon(
                        Icons.add_box_outlined,
                        size: 25,
                      ),
                      const SizedBox(
                        width: 17,
                      ),
                      InkWell(
                        onTap: () {
                          GoRouter.of(context)
                              .pushNamed(AppRouter.kSettingsScreen);
                        },
                        child: const Icon(
                          Icons.menu,
                          size: 25,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              /////////////////////////////////////////////
              // photo and number of posts.....etc
              /////////////////////////////////////////////
              Row(
                children: [
                  CircleAvatar(
                    radius: 48,
                    backgroundColor: Colors.red,
                    child: CircleAvatar(
                      radius: 45,
                      backgroundImage:
                          NetworkImage(userData['imageUrl'] ?? imageUrlOnline),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomColumnTextNum(
                          num: postLength,
                          text: 'Posts',
                        ),
                        CustomColumnTextNum(
                          num: followers,
                          text: 'Followes',
                        ),
                        CustomColumnTextNum(
                          num: following,
                          text: 'Following',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              ////////////////////////////////////////////
              // user name button edit....etc
              ///////////////////////////////////////////
              Column(
                children: [
                  ////////////////////////////////////////////
                  // user name and some information....etc
                  ///////////////////////////////////////////
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        userData['userName'] ?? 'UserName',
                        style: const TextStyle(
                          fontSize: 24,
                        ),
                      ),
                      Text(
                        userData['bio'] ?? 'Bio',
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
                                backgroundImage:
                                    AssetImage('assets/posts/4.jpeg'),
                              ),
                            ),
                            Positioned(
                              left: 20,
                              child: CircleAvatar(
                                radius: 20,
                                backgroundImage:
                                    AssetImage('assets/posts/3.jpeg'),
                              ),
                            ),
                            CircleAvatar(
                              radius: 20,
                              backgroundImage:
                                  AssetImage('assets/posts/2.jpeg'),
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
                      FirebaseAuth.instance.currentUser!.uid == widget.uId
                          ? InkWell(
                              onTap: () {
                                GoRouter.of(context)
                                    .pushNamed(AppRouter.kEditScreen);
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
                            )
                          : isFollowing
                              ? InkWell(
                                  onTap: () {},
                                  child: Container(
                                    padding: const EdgeInsets.all(5),
                                    width:
                                        MediaQuery.of(context).size.width - 70,
                                    child: const Center(
                                      child: Text(
                                        'UnFollow',
                                        style: TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              : InkWell(
                                  onTap: () {},
                                  child: Container(
                                    padding: const EdgeInsets.all(5),
                                    color: Colors.blue,
                                    width:
                                        MediaQuery.of(context).size.width - 70,
                                    child: const Center(
                                      child: Text(
                                        'Follow',
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
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
              // FutureBuilder(
              //     future: FirebaseFirestore.instance
              //         .collection('posts')
              //         .where('uId', isEqualTo: widget.uId)
              //         .get(),
              //     builder: (context, snapshot) {
              //       if (snapshot.connectionState == ConnectionState.waiting) {
              //         return const Center(
              //           child: CircularProgressIndicator(),
              //         );
              //       }
              //       return GridView.builder(
              //         gridDelegate:
              //             const SliverGridDelegateWithFixedCrossAxisCount(
              //           crossAxisCount: 3,
              //           mainAxisSpacing: 2,
              //           crossAxisSpacing: 2,
              //         ),
              //         itemCount: snapshot.data!.docs.length,
              //         itemBuilder: (context, index) {
              //           DocumentSnapshot snap = snapshot.data!.docs[index];
              //           return Container(
              //             child: Image(
              //               image: NetworkImage(
              //                 snap['postUrl'],
              //               ),
              //               fit: BoxFit.fill,
              //             ),
              //           );
              //         },
              //       );
              //     }),
            ],
          ),
        ),
      ),
    ));
  }
}
