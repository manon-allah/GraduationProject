import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/app_router.dart';
import '../../manager/cubit/get_data_cubit.dart';
import 'custom_column_text_num.dart';

class CustomProfileBody extends StatefulWidget {
  const CustomProfileBody({super.key});

  @override
  State<CustomProfileBody> createState() => _CustomProfileBodyState();
}

class _CustomProfileBodyState extends State<CustomProfileBody> {
  int postLength = 0;

  @override
  void initState() {
    super.initState();
    getPostsLength();
  }

  getPostsLength() async {
    var postSnap = await FirebaseFirestore.instance
        .collection('posts')
        .where('uId', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();
    postLength = postSnap.docs.length;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetDataCubit, GetDataState>(
      builder: (context, state) {
        final getDataCubit = context.read<GetDataCubit>().addUserModel;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /////////////////////////////////////////////
            // photo and number of posts.....etc
            /////////////////////////////////////////////
            Padding(
              padding: const EdgeInsets.only(
                left: 15,
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 48,
                    backgroundColor: Colors.red,
                    child: CircleAvatar(
                      radius: 45,
                      backgroundImage: NetworkImage(
                          getDataCubit?.imageUrl ?? imageUrlOnline),
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
                          num: getDataCubit?.flowers.length ?? 0,
                          text: 'Followes',
                        ),
                        CustomColumnTextNum(
                          num: getDataCubit?.flowers.length ?? 0,
                          text: 'Following',
                        ),
                      ],
                    ),
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        getDataCubit?.userName ?? 'UserName',
                        style: const TextStyle(
                          fontSize: 24,
                        ),
                      ),
                      Text(
                        getDataCubit?.bio ?? 'Bio',
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
                          getDataCubit?.website ?? 'Website',
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
            ),
          ],
        );
      },
    );
  }
}
