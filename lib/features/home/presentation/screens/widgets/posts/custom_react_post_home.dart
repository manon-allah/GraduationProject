
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/utils/app_router.dart';

class CustomReactPostHome extends StatelessWidget {
  const CustomReactPostHome({
    super.key,
    required this.likeCubit,
    required this.snap,
  });

  final likeCubit;
  final snap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            likeCubit.likePost(
              snap['postId'],
              snap['uId'],
              snap['likes'],
            );
          },
          icon: snap['likes'].contains(snap['uId'])
              ? const Icon(
                  Icons.favorite,
                  color: Colors.red,
                  size: 25,
                )
              : const Icon(
                  Icons.favorite_border_outlined,
                  size: 25,
                ),
        ),
        IconButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            GoRouter.of(context).pushNamed(AppRouter.kCommentScreen);
          },
          icon: Image.asset(
            'assets/home/comment11.png',
            width: 20,
          ),
        ),
        IconButton(
          padding: EdgeInsets.zero,
          onPressed: () {},
          icon: Image.asset(
            'assets/home/send11.png',
            width: 22,
          ),
        ),
        const Spacer(),
        IconButton(
          onPressed: () {},
          icon: Image.asset(
            'assets/home/save11.png',
            width: 23,
          ),
        ),
      ],
    );
  }
}
