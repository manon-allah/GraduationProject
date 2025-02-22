import 'package:flutter/material.dart';
import 'package:instagram/features/stories/domain/entities/story_entity.dart';
import '../../../../profile/presentation/domain/entities/profile_entity.dart';
import '../upload_story.dart';

class CustomSliverList extends StatelessWidget {
  final ProfileEntity user;
  final List<StoryEntity> stories;
  const CustomSliverList({
    super.key,
    required this.user,
    required this.stories,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          Padding(
            padding: const EdgeInsets.only(
              left: 15,
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Column(
                    children: [
                      Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          CircleAvatar(
                            radius: 40,
                            backgroundImage: NetworkImage(
                              user.imageProfileUrl.isNotEmpty
                                  ? user.imageProfileUrl
                                  : 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR9SRRmhH4X5N2e4QalcoxVbzYsD44C-sQv-w&s',
                            ),
                          ),
                          CircleAvatar(
                            radius: 13,
                            backgroundColor: Colors.blue,
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => UploadStory(
                                      user: user,
                                    ),
                                  ),
                                );
                              },
                              child: const Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(user.userName.isNotEmpty
                          ? user.userName
                          : 'UserName'),
                    ],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  ...List.generate(
                    stories.length,
                    (index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                          right: 10,
                        ),
                        child: Column(
                          children: [
                            const CircleAvatar(
                              radius: 42,
                              backgroundColor: Colors.red,
                              child: CircleAvatar(
                                radius: 40,
                                backgroundImage: AssetImage('assets/4.jpeg'),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text('Story $index'),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
