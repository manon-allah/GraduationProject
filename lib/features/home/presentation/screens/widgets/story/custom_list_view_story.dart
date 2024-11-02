import 'package:flutter/material.dart';

class CustomListViewStory extends StatelessWidget {
  const CustomListViewStory({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: ListView.builder(
        itemCount: 10,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.only(
              right: 5,
            ),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 42,
                  backgroundColor: Colors.red,
                  child: CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/posts/2.jpeg'),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text('Story'),
              ],
            ),
          );
        },
      ),
    );
  }
}
