import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../../lang/locale_keys.g.dart';
import '../../../../../../../post/presentation/manager/cubit/post_cubit.dart';
import '../../../../../domain/entities/profile_entity.dart';
import 'custom_column_text_num.dart';

class CustomPhotoPostsFollowers extends StatelessWidget {
  final String uId;
  final int followersCount;
  final int followingCount;
  final ProfileEntity user;
  const CustomPhotoPostsFollowers({
    super.key,
    required this.user,
    required this.followersCount,
    required this.followingCount,
    required this.uId,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CachedNetworkImage(
          imageUrl: user.imageProfileUrl,
          placeholder: (context, url) => const CircularProgressIndicator(),
          errorWidget: (context, url, error) => Icon(
            Icons.person,
            size: 70,
            color: Theme.of(context).colorScheme.primary,
          ),
          imageBuilder: (context, imageProvider) => Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BlocBuilder<PostCubit, PostState>(
                builder: (context, state) {
                  if (state is PostsSuccess) {
                    final posts = state.posts
                        .where((post) => post.userId == uId)
                        .toList();
                    return CustomColumnTextNum(
                      num: posts.length,
                      text: LocaleKeys.postsTitle.tr(),
                    );
                  } else {
                    return CustomColumnTextNum(
                      num: 0,
                      text: LocaleKeys.postsTitle.tr(),
                    );
                  }
                },
              ),
              CustomColumnTextNum(
                num: followersCount,
                text: LocaleKeys.followerTitle.tr(),
              ),
              CustomColumnTextNum(
                num: followingCount,
                text: LocaleKeys.followingTitle.tr(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
