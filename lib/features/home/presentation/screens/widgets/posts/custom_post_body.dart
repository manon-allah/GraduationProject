import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram/features/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:instagram/features/profile/presentation/manager/get_data/get_data_cubit.dart';
import '../../../../../add_post/presentation/manager/cubit/post_cubit.dart';
import 'custom_list_tile_user_home.dart';
import 'custom_post_card_home.dart';

class CustomPostBody extends StatelessWidget {
  const CustomPostBody({
    super.key,
    required this.snap,
  });
  final snap;

  @override
  Widget build(BuildContext context) {
    final getData = BlocProvider.of<GetDataCubit>(context).addUserModel;
    final getPost = BlocProvider.of<PostCubit>(context);
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        final likeCubit = context.read<HomeCubit>();
        return Column(
          children: [
            // list tile user name....etc
            CustomListTileUserHome(
              snap: snap,
              getData: getData,
              getPost: getPost,
            ),
            // post card
            CustomPostCardHome(
              snap: snap,
              likeCubit: likeCubit,
            ),
          ],
        );
      },
    );
  }
}
