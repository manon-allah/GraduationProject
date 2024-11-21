
import 'package:flutter/material.dart';

class CustomListViewStoryProfile extends StatelessWidget {
  const CustomListViewStoryProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
    );
  }
}
