import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:instagram/core/functions/snack_bar_function.dart';
import 'package:instagram/core/utils/app_router.dart';
import 'package:instagram/features/home/presentation/manager/cubit/like_cubit.dart';
import 'package:instagram/features/profile/presentation/manager/cubit/get_data_cubit.dart';
import 'package:intl/intl.dart';

import '../../../../../add_post/presentation/manager/cubit/post_cubit.dart';
// import '../../../../../../constants.dart';

class CustomPostBody extends StatelessWidget {
  const CustomPostBody({super.key, required this.snap});
  final snap;

  @override
  Widget build(BuildContext context) {
    final getData = BlocProvider.of<GetDataCubit>(context).addUserModel;
    final getPost = BlocProvider.of<PostCubit>(context);
    return BlocBuilder<LikeCubit, LikeState>(
      builder: (context, state) {
        final likeCubit = context.read<LikeCubit>();
        return Column(
          children: [
            //////////////////////////////////////////////////////////
            // list tile user name....etc
            ListTile(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 8,
              ),
              leading: CircleAvatar(
                radius: 22,
                backgroundColor: Colors.red,
                child: CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(snap['profileImage']),
                ),
              ),
              title: Text(
                snap['userName'],
                style: const TextStyle(
                  fontSize: 15,
                ),
              ),
              subtitle: Text(
                getData?.bio ?? 'Bio',
                style: const TextStyle(
                  fontSize: 13,
                ),
              ),
              trailing: IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) => Dialog(
                            child: ListView(
                              padding: const EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 15,
                              ),
                              shrinkWrap: true,
                              children: ['Delete']
                                  .map((e) => InkWell(
                                        onTap: () {
                                          getPost.deletePost(snap['postId']);
                                          
                                          GoRouter.of(context).pop();
                                          showSnackbar('Deleted', context);
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 15,
                                            vertical: 10,
                                          ),
                                          child: Text(e),
                                        ),
                                      ))
                                  .toList(),
                            ),
                          ));
                },
                icon: const Icon(Icons.more_horiz),
              ),
            ),
            ///////////////////////////////////////////////////////
            // post card
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 5,
                  ),
                  child: Image.network(
                    snap['postUrl'],
                    fit: BoxFit.fill,
                    width: double.infinity,
                    height: 390,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    // react in prost....etc

                    Row(
                      children: [
                        IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            likeCubit.likePost(
                              snap['postId'],
                              snap['uId'],
                              snap['likes'],
                            );
                          },
                          icon: snap['likes'].contains(snap['uId'])
                              ? const Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                  size: 25,
                                )
                              : const Icon(
                                  Icons.favorite_border_outlined,
                                  size: 25,
                                ),
                        ),
                        IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            GoRouter.of(context)
                                .pushNamed(AppRouter.kCommentScreen);
                          },
                          icon: Image.asset(
                            'assets/home/comment11.png',
                            width: 20,
                          ),
                        ),
                        IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {},
                          icon: Image.asset(
                            'assets/home/send11.png',
                            width: 22,
                          ),
                        ),
                        const Spacer(),
                        IconButton(
                          onPressed: () {},
                          icon: Image.asset(
                            'assets/home/save11.png',
                            width: 23,
                          ),
                        ),
                      ],
                    ),
                    // numbers of likes....etc
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 15,
                        top: 5,
                      ),
                      child: Text(
                        '${snap['likes'].length} '
                        'Likes',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    // username description....etc
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 15,
                      ),
                      child: Row(
                        children: [
                          Text(
                            snap['userName'],
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            snap['description'],
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 15,
                      ),
                      child: InkWell(
                        onTap: () {},
                        child: const Text(
                          'View all 16 comments',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 15,
                      ),
                      child: Text(
                        DateFormat.yMMMd().format(
                          snap['datePublished'].toDate(),
                        ),
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
