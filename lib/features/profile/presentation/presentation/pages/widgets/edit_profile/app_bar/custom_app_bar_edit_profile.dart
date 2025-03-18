import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../../../../lang/locale_keys.g.dart';

class CustomAppBarEditProfile extends StatelessWidget {
  final void Function()? onPressed;
  const CustomAppBarEditProfile({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            LocaleKeys.cancelTitle.tr(),
            style: const TextStyle(
              fontSize: 17,
              color: Color(0xFF606060),
            ),
          ),
        ),
        Text(
          LocaleKeys.editProfileTitleEdit.tr(),
          style: const TextStyle(
            fontSize: 25,
          ),
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(
            LocaleKeys.doneTitle.tr(),
            style: const TextStyle(
              fontSize: 17,
              color: Colors.blue,
            ),
          ),
        ),
      ],
    );
  }
}
