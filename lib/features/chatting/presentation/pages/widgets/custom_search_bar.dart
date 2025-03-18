import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../lang/locale_keys.g.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 15,
        right: 15,
        bottom: 20,
      ),
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
          hintText: LocaleKeys.searchTitle.tr(),
          prefixIcon: const Icon(
            Icons.search,
            size: 18,
          ),
        ),
      ),
    );
  }
}
