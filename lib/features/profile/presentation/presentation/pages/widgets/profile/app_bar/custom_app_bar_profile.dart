import 'package:flutter/material.dart';
import '../../../../../../../post/presentation/pages/add_post_page.dart';
import '../../../../../../../setting/presentation/pages/setting_page.dart';
import '../../../../../domain/entities/profile_entity.dart';

class CustomAppBarProfile extends StatelessWidget {
  final ProfileEntity user;
  const CustomAppBarProfile({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          user.userName.isNotEmpty ? user.userName : 'UserName',
          style: const TextStyle(
            fontSize: 27,
          ),
        ),
        const Spacer(),
        Row(
          children: [
            IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddPostPage(
                      user: user,
                    ),
                  ),
                );
              },
              icon: const Icon(
                Icons.add_box_outlined,
                size: 25,
              ),
            ),
            IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SettingPage(),
                  ),
                );
              },
              icon: const Icon(
                Icons.menu,
                size: 25,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
