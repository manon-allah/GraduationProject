import 'package:flutter/material.dart';


class StoriesListViewBody extends StatelessWidget {
  // final PostEntity post;
  const StoriesListViewBody({
    super.key,
    //  required this.post,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 15,
        ),
        child: Row(
          children: [
            // profile and user name
            const Column(
              children: [
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: NetworkImage(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR9SRRmhH4X5N2e4QalcoxVbzYsD44C-sQv-w&s'),
                    ),
                    const CircleAvatar(
                      radius: 13,
                      backgroundColor: Colors.blue,
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Text('UserName'),
              ],
            ),
            const SizedBox(
              width: 10,
            ),
            // story list view
            SizedBox(
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
                            backgroundImage: AssetImage('assets/4.jpeg'),
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
            ),
          ],
        ),
      ),
    );
  }
}
