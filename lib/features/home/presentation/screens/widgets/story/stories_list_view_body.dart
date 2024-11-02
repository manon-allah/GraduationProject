import 'package:flutter/material.dart';

import 'custom_add_story.dart';
import 'custom_list_view_story.dart';

class StoriesListViewBody extends StatelessWidget {
  const StoriesListViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: EdgeInsets.only(
          left: 15,
        ),
        child: Row(
          children: [
            CustomAddStory(),
            SizedBox(
              width: 10,
            ),
            CustomListViewStory(),
          ],
        ),
      ),
    );
  }
}
