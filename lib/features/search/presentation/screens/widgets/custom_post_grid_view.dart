import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:instagram/features/search/presentation/manager/cubit/search_cubit.dart';

class CustomPostGridView extends StatelessWidget {
  const CustomPostGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        return state is PostsSuccess
            ? SizedBox(
                height: 700,
                child: MasonryGridView.builder(
                  gridDelegate:
                      const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  itemCount: state.posts.length,
                  mainAxisSpacing: 2,
                  crossAxisSpacing: 2,
                  itemBuilder: (context, index) {
                    final post = state.posts[index];
                    return Image.network(
                      post['postUrl'],
                      fit: BoxFit.fill,
                    );
                  },
                ),
              )
            : const SizedBox();
      },
    );
  }
}
