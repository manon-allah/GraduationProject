import 'package:flutter/material.dart';

import 'widgets/custom_setting_body.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Settings'),
      ),
      body: const CustomSettingBody(),
    );
  }
}
