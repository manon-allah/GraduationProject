import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram/features/search/presentation/manager/cubit/search_cubit.dart';

import '../../../../profile/presentation/screens/profile_screen.dart';

class CustomSearchListView extends StatelessWidget {
  const CustomSearchListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        return state is SearchSuccess
            ? SizedBox(
                height: 700,
                child: ListView.builder(
                  itemCount: state.users.length,
                  itemBuilder: (context, index) {
                    final user = state.users[index];
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProfileScreen(
                              uId: state.users[index]['uId'],
                            ),
                          ),
                        );
                        // GoRouter.of(context)
                        //     .pushNamed(AppRouter.kProfileScreen);
                      },
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                            user['imageUrl'],
                          ),
                        ),
                        title: Text(user['userName']),
                        subtitle: Text(user['bio']),
                      ),
                    );
                  },
                ),
              )
            : const SizedBox();
      },
    );
  }
}
