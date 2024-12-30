import 'package:flutter/material.dart';
import '../../../../../../../post/presentation/pages/add_post_page.dart';
import '../../../../../../../setting/presentation/pages/setting_page.dart';
import '../../../../../domain/entities/profile_entity.dart';

class CustomAppBarProfile extends StatelessWidget {
  final ProfileEntity user;
  final bool isOwn;
  const CustomAppBarProfile({
    super.key,
    required this.user,
    required this.isOwn,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (!isOwn) ...[
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              size: 25,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
        Text(
          user.userName.isNotEmpty ? user.userName : 'UserName',
          style: const TextStyle(
            fontSize: 27,
          ),
        ),
        const Spacer(),
        isOwn
            ? Row(
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
              )
            : IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.more_vert_rounded,
                ),
              ),
      ],
    );
  }
}
