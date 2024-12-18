import 'package:flutter/material.dart';
import '../../../../../profile/presentation/domain/entities/profile_entity.dart';
import '../../../../../profile/presentation/presentation/pages/profile_page.dart';

class CustomListTileUserSearch extends StatelessWidget {
  final ProfileEntity? user;
  const CustomListTileUserSearch({
    super.key,
    required this.user,
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
                uid: user!.uid,
              ),
            ),
          );
        },
        leading: CircleAvatar(
          radius: 25,
          backgroundImage: NetworkImage(
            user!.imageProfileUrl,
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              user!.name,
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              user!.userName,
              style: const TextStyle(
                fontSize: 15,
              ),
            ),
          ],
        ),
        trailing: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_forward_rounded,
            size: 30,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
    );
  }
}
