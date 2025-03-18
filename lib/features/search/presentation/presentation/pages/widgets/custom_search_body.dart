import 'package:flutter/material.dart';
import '../../../../../profile/presentation/domain/entities/profile_entity.dart';
import 'custom_list_tile_user_search.dart';

class CustomSearchBody extends StatefulWidget {
  final List<ProfileEntity?> users;
  const CustomSearchBody({
    super.key,
    required this.users,
  });

  @override
  State<CustomSearchBody> createState() => _CustomSearchBodyState();
}

class _CustomSearchBodyState extends State<CustomSearchBody> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.users.length,
      itemBuilder: (context, index) {
        final user = widget.users[index];
        return CustomListTileUserSearch(
          user: user!,
        );
      },
    );
  }
}
