import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram/features/profile/presentation/domain/entities/profile_entity.dart';
import '../../../../auth/presentation/manager/cubit/auth_cubit.dart';
import '../../../../post/presentation/pages/add_post_page.dart';
import '../like_page.dart';

class CustomAppBar extends StatelessWidget {
  final ProfileEntity user;
  const CustomAppBar({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            Image.asset(
              'assets/instatextw-removebg-preview.png',
              width: 100,
              height: 40,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            const SizedBox(
              width: 5,
            ),
            Transform.rotate(
              angle: 4.71239,
              child: Icon(
                Icons.arrow_back_ios_new,
                size: 20,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
          ],
        ),
        const Spacer(),
        Row(
          children: [
            IconButton(
              onPressed: () {
                context.read<AuthCubit>().logOut();
              },
              icon: Icon(
                Icons.logout,
                size: 25,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LikePage(),
                  ),
                );
              },
              icon: Icon(
                Icons.favorite_border_outlined,
                size: 25,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
            Image.asset(
              'assets/message11.png',
              width: 23,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            IconButton(
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
              icon: Icon(
                Icons.add_box_outlined,
                size: 25,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
