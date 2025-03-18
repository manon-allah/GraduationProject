import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../lang/locale_keys.g.dart';
import 'widgets/custom_setting_body.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(LocaleKeys.settingsTitle.tr()),
      ),
      body: const CustomSettingBody(),
    );
  }
}
