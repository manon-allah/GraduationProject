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
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 8,
            ),
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
              getData?.userName ?? 'UserName',
              style: const TextStyle(
                fontSize: 15,
              ),
            ),
            subtitle: Text(
              getData?.bio ?? 'Bio',
              style: const TextStyle(
                fontSize: 13,
              ),
            ),
            trailing: IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) => Dialog(
                          child: ListView(
                            padding: const EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 15,
                            ),
                            shrinkWrap: true,
                            children: ['Delete']
                                .map((e) => InkWell(
                                      onTap: () {},
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 15,
                                          vertical: 10,
                                        ),
                                        child: Text(e),
                                      ),
                                    ))
                                .toList(),
                          ),
                        ));
              },
              icon: const Icon(Icons.more_horiz),
            ));
      },
    );
  }
}
