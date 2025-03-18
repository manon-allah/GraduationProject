import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../lang/locale_keys.g.dart';
import '../../domain/entities/profile_entity.dart';
import '../manager/cubit/profile_cubit.dart';
import 'widgets/edit_profile/custom_edit_profile_body.dart';

class EditProfilePage extends StatefulWidget {
  final ProfileEntity user;
  const EditProfilePage({
    super.key,
    required this.user,
  });

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state is ProfileLoading) {
          return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircularProgressIndicator(),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(LocaleKeys.uploadingTitle.tr()),
                ],
              ),
            ),
          );
        } else {
          return Scaffold(
            body: CustomEditProfileBody(
              user: widget.user,
            ),
          );
        }
      },
      listener: (context, state) {
        if (state is ProfileSuccess) {
          Navigator.pop(context);
        }
      },
    );
  }
}
