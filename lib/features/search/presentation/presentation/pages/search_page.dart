import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../lang/locale_keys.g.dart';
import '../cubit/search_cubit.dart';
import 'widgets/custom_search_body.dart';
import 'widgets/custom_text_field_search.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController searchController = TextEditingController();
  late final searchCubit = context.read<SearchCubit>();

  @override
  void initState() {
    super.initState();
    searchController.addListener(onSearchChanged);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomTextFieldSearch(
          searchController: searchController,
        ),
      ),
      body: BlocBuilder<SearchCubit, SearchState>(
        builder: (context, state) {
          if (state is SearchSuccess) {
            if (state.users.isEmpty) {
              return Center(
                child: Text(LocaleKeys.noUsersFoundTitle.tr()),
              );
            }
            return CustomSearchBody(
              users: state.users,
            );
          } else if (state is SearchLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is SearchError) {
            return Center(
              child: Text(state.message),
            );
          }
          return Center(
            child: Text(LocaleKeys.searchTitle.tr()),
          );
        },
      ),
    );
  }

  void onSearchChanged() {
    final query = searchController.text;
    searchCubit.searchUser(query);
  }

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }
}
