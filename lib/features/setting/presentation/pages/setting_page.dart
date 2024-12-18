import 'package:flutter/material.dart';
import 'widgets/custom_setting_body.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Settings'),
      ),
      body: const CustomSettingBody(),
    );
  }
}
