import 'package:flutter/material.dart';
import '../../../../../../core/functions/show_snake_bar.dart';
import '../../../../../post/domain/entities/post_entity.dart';
import '../../../../../profile/presentation/domain/entities/profile_entity.dart';
import '../../../../../profile/presentation/presentation/pages/profile_page.dart';

class CustomListTileUserHome extends StatelessWidget {
  final bool isOwnPost;
  final ProfileEntity? postUser;
  final Function(String id)? deletePost;
  final PostEntity post;
  const CustomListTileUserHome({
    super.key,
    required this.post,
    required this.deletePost,
    required this.postUser,
    required this.isOwnPost,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProfilePage(
              uid: post.userId,
            ),
          ),
        );
      },
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 8,
      ),
      leading: postUser?.imageProfileUrl != null
          ? CircleAvatar(
              radius: 22,
              backgroundColor: Colors.red,
              child: CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(
                  postUser!.imageProfileUrl.isNotEmpty
                      ? postUser!.imageProfileUrl
                      : 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR9SRRmhH4X5N2e4QalcoxVbzYsD44C-sQv-w&s',
                ),
              ),
            )
          : const Icon(
              Icons.person,
            ),
      title: Text(
        post.userName.isNotEmpty ? post.userName : 'UserName',
        style: const TextStyle(
          fontSize: 15,
        ),
      ),
      subtitle: Text(
        post.bio.isNotEmpty ? post.bio : 'Bio',
        style: const TextStyle(
          fontSize: 13,
        ),
      ),
      trailing: isOwnPost
          ? IconButton(
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
                                        deletePost!(post.id);
                                        Navigator.pop(context);
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
            )
          : const Text(''),
    );
  }
}
