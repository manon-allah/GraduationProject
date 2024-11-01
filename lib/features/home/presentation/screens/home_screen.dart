import 'package:flutter/material.dart';
import 'package:instagram/features/home/presentation/screens/widgets/custom_post_body.dart';
import 'package:instagram/features/home/presentation/screens/widgets/stories_list_view_body.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Image.asset(
              'assets/login_out/instatextw.png',
              width: 100,
              height: 40,
            ),
            const SizedBox(
              width: 5,
            ),
            Transform.rotate(
              angle: 4.71239,
              child: const Icon(
                Icons.arrow_back_ios_new,
                size: 20,
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              right: 15,
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.favorite_border_outlined,
                  size: 25,
                ),
                const SizedBox(
                  width: 10,
                ),
                Image.asset(
                  'assets/home/message11.png',
                  width: 23,
                ),
                const SizedBox(
                  width: 10,
                ),
                const Icon(
                  Icons.add_box_outlined,
                  size: 25,
                ),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: StoriesListViewBody(),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: 10,
              (context, index) {
                return const CustomPostBody();
              },
            ),
          ),
        ],
      ),
      //  ListView(
      //   children: [
      //     const StoriesListViewBody(),
      //     SizedBox(
      //       height: 700,
      //       child: ListView.builder(
      //           itemCount: 10,
      //           physics: const BouncingScrollPhysics(),
      //           itemBuilder: (context, index) {
      //             return const CustomPostBody();
      //           }),
      //     ),
      //   ],
      // ),
      //  ListView.builder(
      //     itemCount: 10,
      //     physics: const BouncingScrollPhysics(),
      //     itemBuilder: (context, index) {
      //       return const CustomPostBody();
      //     }),
      //  const CustomPostBody(),
    );
  }
}
