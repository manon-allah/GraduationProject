import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../../../../lang/locale_keys.g.dart';

class CustomListViewStoryProfile extends StatelessWidget {
  const CustomListViewStoryProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        itemCount: 10,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(
              right: 15,
            ),
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 28,
                  backgroundColor: Colors.red,
                  child: CircleAvatar(
                    radius: 25,
                    backgroundImage: NetworkImage(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSCalT-bv9Nap_tJoeeiWBSkrjxqFZC2IgyjA&s'),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(LocaleKeys.usernameTitle.tr()),
              ],
            ),
          );
        },
      ),
    );
  }
}
