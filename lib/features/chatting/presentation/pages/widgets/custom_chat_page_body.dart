import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../manage/cubit/chat_cubit.dart';
import 'custom_app_bar_chat.dart';
import 'custom_list_item.dart';
import 'custom_row_text.dart';
import 'custom_search_bar.dart';

class CustomChatPageBody extends StatelessWidget {
  const CustomChatPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(
          child: CustomAppBarChat(),
        ),
        const SliverToBoxAdapter(
          child: CustomSearchBar(),
        ),
        const SliverToBoxAdapter(
          child: CustomRowText(),
        ),
        BlocBuilder<ChatCubit, ChatState>(
          builder: (context, state) {
            if (state is ChatLoading) {
              return const SliverToBoxAdapter(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else if (state is ChatLoaded) {
              final users = state.users;
              return SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final userData = users[index];
                    return CustomListItem(
                      userData: userData,
                      context: context,
                    );
                  },
                  childCount: users.length,
                ),
              );
            } else {
              return const SliverToBoxAdapter(
                child: Center(
                  child: Text('Error'),
                ),
              );
            }
          },
        ),
      ],
    );
  }
}
