import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../auth/domain/entities/user_entity.dart';
import '../../../../auth/presentation/manager/cubit/auth_cubit.dart';
import '../manager/cubit/profile_cubit.dart';
import 'widgets/custom_profile_body.dart';

class ProfilePage extends StatefulWidget {
  final String uid;
  const ProfilePage({
    super.key,
    required this.uid,
  });

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late final authCubit = context.read<AuthCubit>();
  late final profileCubit = context.read<ProfileCubit>();

  late UserEntity? currentUser = authCubit.currentUser;

  @override
  void initState() {
    super.initState();
    profileCubit.getCurrentProfile(widget.uid);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state is ProfileSuccess) {
          final user = state.profile;
          return Scaffold(
            body: CustomProfileBody(
              followersCount: user.followers.length,
              followingCount: user.following.length,
              currentUid: currentUser!.uid,
              isFollowing: user.followers.contains(currentUser!.uid),
              onTap: followButton,
              uid: widget.uid,
              profile: user,
            ),
          );
        } else if (state is ProfileLoading) {
          return const Scaffold(
              body: Center(
            child: CircularProgressIndicator(),
          ));
        } else {
          return const Center(
            child: Text('No profile founded...'),
          );
        }
      },
    );
  }

  void followButton() {
    final profileState = profileCubit.state;

    if (profileState is! ProfileSuccess) {
      return;
    }

    final profileUser = profileState.profile;
    final isFollowing = profileUser.followers.contains(currentUser!.uid);

    setState(() {
      if (isFollowing) {
        profileUser.followers.remove(currentUser!.uid);
      } else {
        profileUser.followers.add(currentUser!.uid);
      }
    });

    profileCubit.toggleFollow(currentUser!.uid, widget.uid).catchError((error) {
      setState(() {
        if (isFollowing) {
          profileUser.followers.add(currentUser!.uid);
        } else {
          profileUser.followers.remove(currentUser!.uid);
        }
      });
    });
  }
}
