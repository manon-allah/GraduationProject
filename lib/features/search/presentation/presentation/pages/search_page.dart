import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/search_cubit.dart';
import 'widgets/custom_search_body.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController searchController = TextEditingController();
  late final searchCubit = context.read<SearchCubit>();

  void onSearchChanged() {
    final query = searchController.text;
    searchCubit.searchUser(query);
  }

  @override
  void initState() {
    super.initState();
    searchController.addListener(onSearchChanged);
  }

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: searchController,
          decoration: InputDecoration(
            filled: true,
            fillColor: Theme.of(context).colorScheme.secondary,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(24),
              borderSide: BorderSide.none,
            ),
            hintText: 'Search for a user',
            hintStyle: TextStyle(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
      ),
      body: BlocBuilder<SearchCubit, SearchState>(
        builder: (context, state) {
          if (state is SearchSuccess) {
            if (state.users.isEmpty) {
              return const Center(
                child: Text('No users found'),
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
          return const Center(
            child: Text('Search for a user'),
          );
        },
      ),
    );
  }
}
