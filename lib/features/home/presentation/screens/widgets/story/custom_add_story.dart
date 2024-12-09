import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram/features/profile/presentation/manager/get_data/get_data_cubit.dart';

import '../../../../../../constants.dart';

class CustomAddStory extends StatelessWidget {
  const CustomAddStory({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetDataCubit, GetDataState>(
      builder: (context, state) {
        final getData = BlocProvider.of<GetDataCubit>(context).addUserModel;
        return Column(
          children: [
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage:
                      NetworkImage(getData?.imageUrl ?? imageUrlOnline),
                ),
                const CircleAvatar(
                  radius: 13,
                  backgroundColor: Colors.blue,
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Text(getData?.userName ?? 'UserName'),
          ],
        );
      },
    );
  }
}
