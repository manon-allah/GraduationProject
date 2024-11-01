import 'package:flutter/material.dart';
import 'package:instagram/features/profile/presentation/screens/widgets/custom_profile_body.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'username',
          style: TextStyle(
            fontSize: 27,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              right: 15,
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.add_box_outlined,
                  size: 25,
                ),
                const SizedBox(
                  width: 17,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, 'setting');
                  },
                  child: const Icon(
                    Icons.menu,
                    size: 25,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: const CustomProfileBody(),
    );
  }
}
