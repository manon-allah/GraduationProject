import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../../lang/locale_keys.g.dart';

class CustomAllComments extends StatelessWidget {
  const CustomAllComments({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 15,
      ),
      child: InkWell(
        onTap: () {},
        child: Text(
          LocaleKeys.commentsTitle.tr(),
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 17,
          ),
        ),
      ),
    );
  }
}
