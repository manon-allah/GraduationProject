import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../lang/locale_keys.g.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(LocaleKeys.explorePageTitle.tr()),
      ),
    );
  }
}
