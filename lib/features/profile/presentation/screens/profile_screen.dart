import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram/features/profile/presentation/manager/profile/profile_cubit.dart';
import 'widgets/custom_profile_body.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    super.key,
    required this.uId,
  });
  final String uId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit()..getProfileData(uId),
      child: Scaffold(
        body: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            if (state is UserDataSuccess) {
              return CustomProfileBody(
                userData: state.userData,
                postLength: state.postLength,
                followers: state.followers,
                following: state.following,
                isFollowing: state.isFollowing,
                posts: state.posts,
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
