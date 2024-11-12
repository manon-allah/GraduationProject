import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram/constants.dart';
import 'package:instagram/features/profile/presentation/manager/cubit/get_data_cubit.dart';

class CustomListTileUserName extends StatelessWidget {
  const CustomListTileUserName({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetDataCubit, GetDataState>(
      builder: (context, state) {
        final getData = context.read<GetDataCubit>().addUserModel;
        return ListTile(
          leading: CircleAvatar(
            radius: 22,
            backgroundColor: Colors.red,
            child: CircleAvatar(
              radius: 20,
              backgroundImage:
                  NetworkImage(getData?.imageUrl ?? imageUrlOnline),
            ),
          ),
          title: Text(
            getData?.userName ?? 'no data',
            style: const TextStyle(
              fontSize: 15,
            ),
          ),
          subtitle: Text(
            getData?.bio ?? 'no data',
            style: const TextStyle(
              fontSize: 13,
            ),
          ),
          trailing: const Icon(Icons.more_horiz),
        );
      },
    );
  }
}
