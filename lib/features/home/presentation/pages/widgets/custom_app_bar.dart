import 'package:flutter/material.dart';
import '../like_page.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

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
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => AddPostPage(
                //       user: widget.user,
                //     ),
                //   ),
                // );
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