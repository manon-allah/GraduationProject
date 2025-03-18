import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../lang/locale_keys.g.dart';

class CustomLanguageApp extends StatefulWidget {
  const CustomLanguageApp({
    super.key,
  });

  @override
  State<CustomLanguageApp> createState() => _CustomLanguageAppState();
}

class _CustomLanguageAppState extends State<CustomLanguageApp> {
  bool lang = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Theme.of(context).colorScheme.primary,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
           Text(
            LocaleKeys.arabicLanguageTitle.tr(),
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
          const SizedBox(
            width: 40,
          ),
          InkWell(
            onTap: () async {
              if (lang == false) {
                setState(() {
                  lang = true;
                });
                await context.setLocale(const Locale('ar'));
              } else {
                setState(() {
                  lang = false;
                });
                await context.setLocale(const Locale('en'));
              }
            },
            child: const Icon(
              Icons.language_rounded,
            ),
          ),
        ],
      ),
    );
  }
}
