import 'package:flutter/material.dart';
import 'package:instagram/features/bottom_nav_bar/presentation/widgets/custom_post_body.dart';
import 'package:instagram/features/bottom_nav_bar/presentation/widgets/stories_list_view_body.dart';

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
            const Icon(
              Icons.arrow_drop_down,
              size: 30,
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
                Image.asset('assets/home/send.jpg'),
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
      body: ListView(
        children: [
          const StoriesListViewBody(),
          SizedBox(
            height: 700,
            child: ListView.builder(
                itemCount: 10,
                scrollDirection: Axis.vertical,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return const CustomPostBody();
                }),
          ),
        ],
      ),
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
