import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../lang/locale_keys.g.dart';

class CustomTextFieldCaption extends StatelessWidget {
  const CustomTextFieldCaption({
    super.key,
    required this.captionController,
  });

  final TextEditingController captionController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.7,
      child: TextField(
        controller: captionController,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: LocaleKeys.writeCaptionTitle.tr(),
        ),
        maxLines: 3,
      ),
    );
  }
}
