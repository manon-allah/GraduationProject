import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram/features/profile/presentation/manager/cubit/get_data_cubit.dart';

class CustomAppBarChat extends StatelessWidget {
  const CustomAppBarChat({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetDataCubit, GetDataState>(
      builder: (context, state) {
        final getData = context.read<GetDataCubit>().addUserModel;
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
                getData?.userName ?? 'no data',
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
      },
    );
  }
}
