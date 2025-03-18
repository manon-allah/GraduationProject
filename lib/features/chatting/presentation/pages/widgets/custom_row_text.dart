import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../lang/locale_keys.g.dart';

class CustomRowText extends StatelessWidget {
  const CustomRowText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
      child: Row(
        children: [
          Text(
            LocaleKeys.messagesTitle.tr(),
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
          const Spacer(),
          Row(
            children: [
              Text(
                LocaleKeys.requestsTitle.tr(),
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios_rounded,
                size: 15,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
