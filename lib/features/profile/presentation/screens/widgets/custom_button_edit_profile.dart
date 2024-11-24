import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:instagram/constants.dart';
import '../../../../../core/utils/app_router.dart';
import '../../manager/profile/profile_cubit.dart';
import 'custom_button_profile.dart';

class CustomButtonEditProfile extends StatefulWidget {
  const CustomButtonEditProfile({
    super.key,
    required this.uId,
    required this.isFollowing,
    required this.userData,
    required this.followers,
  });
  final String uId;
  final bool isFollowing;
  final int followers;
  final Map<String, dynamic> userData;

  @override
  State<CustomButtonEditProfile> createState() =>
      _CustomButtonEditProfileState();
}

class _CustomButtonEditProfileState extends State<CustomButtonEditProfile> {
  late bool isFollowing;
  late int followers;

  @override
  void initState() {
    super.initState();
    isFollowing = widget.isFollowing;
    followers = widget.followers;
  }

  @override
  Widget build(BuildContext context) {
    final profileCubit = BlocProvider.of<ProfileCubit>(context);
    return Row(
      children: [
        currentUserId == widget.uId
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
            : widget.isFollowing
                ? CustomButton(
                    width: MediaQuery.of(context).size.width - 33,
                    fontSize: 18,
                    text: 'UnFollow',
                    onTap: () async {
                      await profileCubit.followUser(
                          currentUserId, widget.userData['uId']);
                          setState(() {
                            isFollowing = false;
                            followers--;
                          });
                    },
                    colorText: Colors.black,
                    colorContainer: const Color(0xFFEFEFEF),
                  )
                : Column(
                    children: [
                      CustomButton(
                        width: MediaQuery.of(context).size.width - 33,
                        fontSize: 20,
                        text: 'Follow',
                        onTap: () async {
                          await profileCubit.followUser(
                              currentUserId, widget.userData['uId']);
                          setState(() {
                            isFollowing = true;
                            followers++;
                          });
                        },
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
