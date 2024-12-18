import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../../auth/domain/entities/user_entity.dart';
import '../../../../../post/domain/entities/post_entity.dart';

class CustomReactPostHome extends StatefulWidget {
  final UserEntity currrentUser;
  final void Function()? toggleLike;
  final PageController nextPage;
  final PostEntity post;
  const CustomReactPostHome({
    super.key,
    required this.post,
    required this.nextPage,
    required this.toggleLike,
    required this.currrentUser,
  });

  @override
  State<CustomReactPostHome> createState() => _CustomReactPostHomeState();
}

class _CustomReactPostHomeState extends State<CustomReactPostHome> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          padding: EdgeInsets.zero,
          onPressed: widget.toggleLike,
          icon: widget.post.likes.contains(widget.currrentUser.uid)
              ? const Icon(
                  Icons.favorite,
                  color: Colors.red,
                  size: 25,
                )
              : Icon(
                  Icons.favorite_border_outlined,
                  size: 25,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
        ),
        IconButton(
          padding: EdgeInsets.zero,
          onPressed: () {},
          icon: Image.asset(
            'assets/comment11.png',
            width: 20,
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
        ),
        IconButton(
          padding: EdgeInsets.zero,
          onPressed: () {},
          icon: Image.asset(
            'assets/send11.png',
            width: 22,
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
        ),
        const Spacer(),
        widget.post.postImageUrl!.length > 1
            ? SmoothPageIndicator(
                controller: widget.nextPage,
                count: widget.post.postImageUrl!.length,
                effect: WormEffect(
                  activeDotColor: Theme.of(context).colorScheme.inversePrimary,
                  dotColor: Theme.of(context).colorScheme.primary,
                  dotHeight: 7,
                  dotWidth: 7,
                  spacing: 7.0,
                ),
              )
            : const SizedBox(),
        const Spacer(
          flex: 2,
        ),
        IconButton(
          onPressed: () {},
          icon: Image.asset(
            'assets/save11.png',
            width: 23,
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
        ),
      ],
    );
  }
}
