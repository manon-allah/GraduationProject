import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram/constants.dart';
import '../../manager/cubit/search_cubit.dart';
import 'custom_post_grid_view.dart';
import 'custom_search_list_view.dart';

class CustomSearchBody extends StatefulWidget {
  const CustomSearchBody({super.key});

  @override
  State<CustomSearchBody> createState() => _CustomSearchBodyState();
}

class _CustomSearchBodyState extends State<CustomSearchBody> {
  final TextEditingController searchController = TextEditingController();
  bool isShow = false;

  @override
  void initState() {
    super.initState();
    final uId = cashing.getData(key: 'token');
    BlocProvider.of<SearchCubit>(context).getPosts(uId);
  }

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  height: 100,
                  width: 400,
                  child: TextFormField(
                    controller: searchController,
                    onFieldSubmitted: (value) {
                      setState(() {
                        isShow = true;
                      });
                      BlocProvider.of<SearchCubit>(context)
                          .searchUsersbyUserName(value);
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide.none,
                      ),
                      hintText: 'Search for users',
                      prefixIcon: const Icon(
                        Icons.search,
                        size: 18,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const CustomSearchListView(),
            const CustomPostGridView(),
          ],
        ),
      ),
    );
  }
}
