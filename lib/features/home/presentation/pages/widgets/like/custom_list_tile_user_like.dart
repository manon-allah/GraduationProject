import 'package:flutter/material.dart';
import '../../../../../post/domain/entities/post_entity.dart';
import '../../../../../profile/presentation/domain/entities/profile_entity.dart';
import '../../../../../profile/presentation/presentation/pages/profile_page.dart';

class CustomListTileUserLike extends StatelessWidget {
  final PostEntity post;
  final ProfileEntity user;
  final String text;

  const CustomListTileUserLike({
    super.key,
    required this.user,
    required this.text,
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 15,
      ),
      child: ListTile(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProfilePage(
                uid: user.uid,
              ),
            ),
          );
        },
        leading: CircleAvatar(
          radius: 30,
          backgroundImage: NetworkImage(
            user.imageProfileUrl,
          ),
        ),
        title: Row(
          children: [
            Text(
              user.userName,
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              text,
              style: const TextStyle(
                fontSize: 15,
              ),
            ),
          ],
        ),
        trailing: Image.network(
          post.postImageUrl!.first,
          width: 70,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
