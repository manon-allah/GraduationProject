import 'package:flutter/material.dart';
import 'custom_language_app.dart';
import 'custom_light_dark_mode.dart';
import 'custom_log_out_button.dart';

class CustomSettingBody extends StatefulWidget {
  const CustomSettingBody({super.key});

  @override
  State<CustomSettingBody> createState() => _CustomSettingBodyState();
}

class _CustomSettingBodyState extends State<CustomSettingBody> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 15,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 50,
          ),
          CustomLightDarkMode(),
          SizedBox(
            height: 50,
          ),
          CustomLanguageApp(),
          Spacer(),
          CustomLogOutButton(),
          SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }
}
