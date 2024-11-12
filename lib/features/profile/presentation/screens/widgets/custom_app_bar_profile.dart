import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:instagram/features/profile/presentation/manager/cubit/get_data_cubit.dart';

import '../../../../../core/utils/app_router.dart';

class CustomAppBarProfile extends StatelessWidget {
  const CustomAppBarProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetDataCubit, GetDataState>(
      builder: (context, state) {
        final getData = context.read<GetDataCubit>().addUserModel;
        return Padding(
          padding: const EdgeInsets.only(
            top: 50,
            left: 10,
          ),
          child: Row(
            children: [
              Text(
                getData?.userName ?? 'no data',
                style: const TextStyle(
                  fontSize: 27,
                ),
              ),
              const Spacer(),
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
                        GoRouter.of(context)
                            .pushNamed(AppRouter.kSettingsScreen);
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
        );
      },
    );
  }
}
