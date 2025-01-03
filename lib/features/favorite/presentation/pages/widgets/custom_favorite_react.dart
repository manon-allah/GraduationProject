import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../auth/domain/entities/user_entity.dart';
import '../../../../post/domain/entities/post_entity.dart';
import '../../manager/cubit/favorite_cubit.dart';

class CustomFavoriteReact extends StatefulWidget {
  final UserEntity currrentUser;
  final PageController nextPage;
  final PostEntity post;
  const CustomFavoriteReact({
    super.key,
    required this.currrentUser,
    required this.nextPage,
    required this.post,
  });

  @override
  State<CustomFavoriteReact> createState() => _CustomFavoriteReactState();
}

class _CustomFavoriteReactState extends State<CustomFavoriteReact> {
  @override
  Widget build(BuildContext context) {
    final favoriteCubit = context.watch<FavoriteCubit>();
    final isFavorite = favoriteCubit.isFavorite(widget.post);
    return Row(
      children: [
        IconButton(
          padding: EdgeInsets.zero,
          onPressed:(){
            setState(() {
              if (widget.post.likes.contains(widget.currrentUser.uid)) {
                widget.post.likes.remove(widget.currrentUser.uid);
              } else {
                widget.post.likes.add(widget.currrentUser.uid);
              }
            });
          },
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
          onPressed: () async {
            if (isFavorite) {
              favoriteCubit.removeFromFavorites(widget.post);
            } else {
              favoriteCubit.addToFavorites(widget.post);
            }
          },
          icon: Icon(
            isFavorite ? Icons.bookmark : Icons.bookmark_border_outlined,
            color: isFavorite
                ? Theme.of(context).colorScheme.inversePrimary
                : Colors.grey,
            size: 25,
          ),
        ),
      ],
    );
  }
}
