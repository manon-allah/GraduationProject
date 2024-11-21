import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram/constants.dart';
import 'package:instagram/features/home/presentation/screens/widgets/posts/custom_post_body.dart';
import 'package:instagram/features/home/presentation/screens/widgets/story/stories_list_view_body.dart';

import '../manager/home_cubit/home_cubit.dart';
import 'widgets/app_bar/custom_app_bar_home.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final uId = cashing.getData(key: 'token');
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getPosts(uId),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is HomeNoPosts) {
            return const Center(
              child: Text(
                'No Posts yet',
                style: TextStyle(color: Colors.black),
              ),
            );
          } else if (state is HomePostsSuccess) {
            return Scaffold(
              body: CustomScrollView(
                slivers: [
                  const SliverToBoxAdapter(
                    child: CustomAppBarHome(),
                  ),
                  const SliverToBoxAdapter(
                    child: StoriesListViewBody(),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      childCount: state.posts.length,
                      (context, index) {
                        return CustomPostBody(
                          snap: state.posts[index],
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
    // BlocConsumer<SwitchCubit, SwitchState>(
    //   listener: (context, state) {},
    //   builder: (context, state) {
    //     return Scaffold(
    //       body: StreamBuilder(
    //         stream: FirebaseFirestore.instance
    //             .collection('posts')
    //             .where('uId', isEqualTo: uId)
    //             // .where('datePublished', isNotEqualTo: null)
    //             // .orderBy('datePublished', descending: true)
    //             .snapshots(),
    //         builder: (context,
    //             AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
    //           if (snapshot.connectionState == ConnectionState.waiting) {
    //             return const Center(
    //               child: CircularProgressIndicator(
    //                 color: Colors.black,
    //               ),
    //             );
    //           }
    //           if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
    //             return const Center(
    //               child: Text(
    //                 'No Posts yet',
    //                 style: TextStyle(color: Colors.black),
    //               ),
    //             );
    //           }
    //           return CustomScrollView(
    //             slivers: [
    //               const SliverToBoxAdapter(
    //                 child: CustomAppBarHome(),
    //               ),
    //               const SliverToBoxAdapter(
    //                 child: StoriesListViewBody(),
    //               ),
    //               SliverList(
    //                 delegate: SliverChildBuilderDelegate(
    //                   childCount: snapshot.data!.docs.length,
    //                   (context, index) {
    //                     return CustomPostBody(
    //                       snap: snapshot.data!.docs[index].data(),
    //                     );
    //                   },
    //                 ),
    //               ),
    //             ],
    //           );
    //         },
    //       ),
    //     );
    //   },
    // );
  }
}
