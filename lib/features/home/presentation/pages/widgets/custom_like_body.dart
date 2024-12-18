import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../post/domain/entities/post_entity.dart';
import '../../../../profile/presentation/presentation/manager/cubit/profile_cubit.dart';
import 'custom_list_tile_user.dart';

class CustomLikeBody extends StatefulWidget {
  final List<PostEntity> posts;
  final String text;
  final List<String> uIds;
  final String emptyMessage;
  final BuildContext context;
  const CustomLikeBody({
    super.key,
    required this.uIds,
    required this.emptyMessage,
    required this.context,
    required this.text,
    required this.posts,
  });

  @override
  State<CustomLikeBody> createState() => _CustomLikeBodyState();
}

class _CustomLikeBodyState extends State<CustomLikeBody> {
  @override
  Widget build(BuildContext context) {
    return widget.uIds.isEmpty
        ? Center(
            child: Text(widget.emptyMessage),
          )
        : ListView.builder(
            itemCount: widget.uIds.length,
            itemBuilder: (context, index) {
              final uId = widget.uIds[index];
              final post = widget.posts[index];

              return FutureBuilder(
                future: context.read<ProfileCubit>().getProfile(uId),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final user = snapshot.data;

                    return CustomListTileUser(
                      text: widget.text,
                      post: post,
                      user: user!,
                    );
                  } else if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return const ListTile(
                      title: Text('Loading...'),
                    );
                  } else {
                    return const ListTile(
                      title: Text('User not found..'),
                    );
                  }
                },
              );
            },
          );
  }
}
