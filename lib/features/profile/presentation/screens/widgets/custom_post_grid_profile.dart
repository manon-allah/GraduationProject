// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
// import 'package:instagram/features/profile/presentation/manager/profile/profile_cubit.dart';

// class CustomPostGridProfile extends StatelessWidget {
//   const CustomPostGridProfile({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<ProfileCubit, ProfileState>(
//       builder: (context, state) {
//         return state is UserDataSuccess
//             ? SizedBox(
//                 height: 300,
//                 child: MasonryGridView.builder(
//                   gridDelegate:
//                       const SliverSimpleGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 3,
//                   ),
//                   itemCount: state.posts.length,
//                   mainAxisSpacing: 2,
//                   crossAxisSpacing: 2,
//                   itemBuilder: (context, index) {
//                     final post = state.posts[index];
//                     return Image.network(
//                       post['postUrl'],
//                       fit: BoxFit.fill,
//                     );
//                   },
//                 ),
//               )
//             : const SizedBox();
//       },
//     );
//   }
// }
