import 'package:flutter/material.dart';
import 'package:instagram/features/auth/domain/entities/user_entity.dart';
import '../../../../../domain/entities/profile_entity.dart';
import '../../../edit_profile_page.dart';
import 'custom_button.dart';

class CustomButtonEditProfile extends StatelessWidget {
  final UserEntity currentUid;
  final String userProfile;
  final ProfileEntity user;
  final void Function()? onTap;
  final bool isFollowing;
  const CustomButtonEditProfile({
    super.key,
    required this.user,
    required this.onTap,
    required this.isFollowing,
    required this.currentUid,
    required this.userProfile,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        currentUid.uid == userProfile
            ? Row(
                children: [
                  CustomButton(
                    width: MediaQuery.of(context).size.width - 70,
                    fontSize: 18,
                    text: 'Edit profile',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditProfilePage(
                            user: user,
                          ),
                        ),
                      );
                    },
                    colorText: Theme.of(context).colorScheme.inversePrimary,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    child: Icon(
                      Icons.person_add,
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                ],
              )
            : isFollowing
                ? CustomButton(
                    width: MediaQuery.of(context).size.width - 33,
                    fontSize: 18,
                    text: 'UnFollow',
                    onTap: onTap,
                    colorText: Theme.of(context).colorScheme.inversePrimary,
                    colorContainer: Theme.of(context).colorScheme.primary,
                  )
                : Column(
                    children: [
                      CustomButton(
                        width: MediaQuery.of(context).size.width - 33,
                        fontSize: 20,
                        text: 'Follow',
                        onTap: onTap,
                        colorText: Colors.white,
                        colorContainer: Colors.blue,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 5,
                              horizontal: 22,
                            ),
                            child: const Text(
                              'Message',
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 5,
                              horizontal: 22,
                            ),
                            child: const Text(
                              'SubScribe',
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 5,
                              horizontal: 22,
                            ),
                            child: const Text(
                              'Contact',
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            padding: const EdgeInsets.all(5),
                            child: Icon(
                              Icons.person_add,
                              color:
                                  Theme.of(context).colorScheme.inversePrimary,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
      ],
    );
  }
}
