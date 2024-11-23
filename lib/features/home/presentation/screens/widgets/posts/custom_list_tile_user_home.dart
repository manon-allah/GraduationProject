
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../core/functions/snack_bar_function.dart';

class CustomListTileUserHome extends StatelessWidget {
  const CustomListTileUserHome({
    super.key,
    required this.snap,
    required this.getData,
    required this.getPost,
  });

  final snap;
  final getData;
  final getPost;

  @override
  Widget build(BuildContext context) {
    return ListTile(
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
        snap['userName'] ?? 'UserName',
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
    );
  }
}
