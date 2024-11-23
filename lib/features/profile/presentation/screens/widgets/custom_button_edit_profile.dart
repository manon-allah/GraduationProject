import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:instagram/constants.dart';
import '../../../../../core/utils/app_router.dart';
import 'custom_button_profile.dart';

class CustomButtonEditProfile extends StatelessWidget {
  const CustomButtonEditProfile({
    super.key,
    required this.uId,
    required this.isFollowing,
  });
  final String uId;
  final bool isFollowing;

  @override
  Widget build(BuildContext context) {
    final currentUId = cashing.getData(key: 'token');
    return Row(
      children: [
        currentUId == uId
            ? Row(
                children: [
                  CustomButton(
                    width: MediaQuery.of(context).size.width - 70,
                    fontSize: 18,
                    text: 'Edit profile',
                    onTap: () {
                      GoRouter.of(context).pushNamed(AppRouter.kEditScreen);
                    },
                    colorText: Colors.black,
                    colorContainer: const Color(0xFFEFEFEF),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    color: const Color(0xFFEFEFEF),
                    child: const Icon(
                      Icons.person_add,
                    ),
                  ),
                ],
              )
            : isFollowing
                ? CustomButton(
                    width: MediaQuery.of(context).size.width - 6,
                    fontSize: 18,
                    text: 'UnFollow',
                    onTap: () {},
                    colorText: Colors.black,
                    colorContainer: const Color(0xFFEFEFEF),
                  )
                : Column(
                    children: [
                      CustomButton(
                        width: MediaQuery.of(context).size.width - 33,
                        fontSize: 20,
                        text: 'Follow',
                        onTap: () {},
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
                            color: const Color(0xFFEFEFEF),
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
                            color: const Color(0xFFEFEFEF),
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
                            color: const Color(0xFFEFEFEF),
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
                            color: const Color(0xFFEFEFEF),
                            child: const Icon(
                              Icons.person_add,
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
