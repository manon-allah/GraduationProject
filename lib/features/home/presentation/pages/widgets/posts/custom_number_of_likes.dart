import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../../../lang/locale_keys.g.dart';
import '../../../../../post/domain/entities/post_entity.dart';

class CustomNumberOfLikes extends StatelessWidget {
  final PostEntity post;
  const CustomNumberOfLikes({
    super.key,
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 15,
        top: 5,
      ),
      child: Row(
        children: [
          SizedBox(
            width: 20,
            child: Text(
              '${post.likes.length}',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Text(
            LocaleKeys.likesTitle.tr(),
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
