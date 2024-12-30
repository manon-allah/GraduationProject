import 'package:flutter/material.dart';
import '../../../data/repos/chat_repo_imp.dart';
import '../../../domain/repos/chat_repo.dart';
import 'custom_app_bar_chat.dart';
import 'custom_list_item.dart';
import 'custom_row_text.dart';
import 'custom_search_bar.dart';

class CustomChatPageBody extends StatelessWidget {
  const CustomChatPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    final ChatRepository chatRepo = ChatRepoImp();
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
        StreamBuilder(
          stream: chatRepo.getUsersStream(),
          builder: (context, snapShot) {
            if (snapShot.hasError) {
              return const SliverToBoxAdapter(
                child: Center(
                  child: Text('Error'),
                ),
              );
            }
            if (snapShot.connectionState == ConnectionState.waiting) {
              return const SliverToBoxAdapter(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
            final users = snapShot.data as List<Map<String, dynamic>>;
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
          },
        ),
      ],
    );
  }
}
