import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../auth/domain/entities/user_entity.dart';
import '../../../../auth/presentation/manager/cubit/auth_cubit.dart';
import '../../../../profile/presentation/presentation/manager/cubit/profile_cubit.dart';

class CustomAppBarChat extends StatefulWidget {
  const CustomAppBarChat({super.key});

  @override
  State<CustomAppBarChat> createState() => _CustomAppBarChatState();
}

class _CustomAppBarChatState extends State<CustomAppBarChat> {
  late final authCubit = context.read<AuthCubit>();
  late final profileCubit = context.read<ProfileCubit>();
  late UserEntity? currentUser = authCubit.currentUser;

  @override
  void initState() {
    super.initState();
    profileCubit.getCurrentProfile(currentUser!.uid);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state is ProfileSuccess) {
          final user = state.profile;
          return Padding(
            padding: const EdgeInsets.only(
              left: 15,
              right: 15,
              top: 50,
              bottom: 10,
            ),
            child: Row(
              children: [
                Text(
                  user.userName.isNotEmpty ? user.userName : 'UserName',
                  style: const TextStyle(
                    fontSize: 25,
                  ),
                ),
                const Spacer(),
                const Icon(
                  Icons.messenger_outline_rounded,
                  size: 25,
                ),
              ],
            ),
          );
        } else {
          return const Padding(
            padding: EdgeInsets.only(
              left: 15,
              right: 15,
              top: 50,
              bottom: 10,
            ),
            child: Row(
              children: [
                Text(
                  '',
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
                Spacer(),
                Icon(
                  Icons.messenger_outline_rounded,
                  size: 25,
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
