import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram/features/auth/domain/entities/user_entity.dart';
import 'package:instagram/features/profile/presentation/domain/entities/profile_entity.dart';
import 'package:instagram/features/stories/presentation/manager/cubit/story_cubit.dart';
import '../../../../auth/presentation/manager/cubit/auth_cubit.dart';
import 'custom_sliver_list.dart';

class StoriesListViewBody extends StatefulWidget {
  final ProfileEntity user;
  const StoriesListViewBody({
    super.key,
    required this.user,
  });

  @override
  State<StoriesListViewBody> createState() => _StoriesListViewBodyState();
}

class _StoriesListViewBodyState extends State<StoriesListViewBody> {
  late final storyCubit = context.read<StoryCubit>();

  UserEntity? currentUser;

  @override
  void initState() {
    super.initState();
    getAllStories();
    getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StoryCubit, StoryState>(
      builder: (context, state) {
        if (state is StoryLoading) {
          return const SliverToBoxAdapter(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is StorySuccess) {
          final stories = state.stories;
          return CustomSliverList(
            stories: stories,
            user: widget.user,
          );
        } else {
          return const SliverToBoxAdapter(
            child: SizedBox(),
          );
        }
      },
    );
  }

  void getAllStories() {
    storyCubit.getAllStories();
  }

  getCurrentUser() {
    final authCubit = context.read<AuthCubit>();
    currentUser = authCubit.currentUser;
  }
}







// import 'package:flutter/material.dart';


// class StoriesListViewBody extends StatelessWidget {
//   // final PostEntity post;
//   const StoriesListViewBody({
//     super.key,
//     //  required this.post,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       scrollDirection: Axis.horizontal,
//       child: Padding(
//         padding: const EdgeInsets.only(
//           left: 15,
//         ),
//         child: Row(
//           children: [
//             // profile and user name
//             const Column(
//               children: [
//                 Stack(
//                   alignment: Alignment.bottomRight,
//                   children: [
//                     CircleAvatar(
//                       radius: 40,
//                       backgroundImage: NetworkImage(
//                           'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR9SRRmhH4X5N2e4QalcoxVbzYsD44C-sQv-w&s'),
//                     ),
//                     const CircleAvatar(
//                       radius: 13,
//                       backgroundColor: Colors.blue,
//                       child: Icon(
//                         Icons.add,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(
//                   height: 5,
//                 ),
//                 Text('UserName'),
//               ],
//             ),
//             const SizedBox(
//               width: 10,
//             ),
//             // story list view
//             SizedBox(
//               height: 110,
//               child: ListView.builder(
//                 itemCount: 10,
//                 shrinkWrap: true,
//                 physics: const NeverScrollableScrollPhysics(),
//                 scrollDirection: Axis.horizontal,
//                 itemBuilder: (context, index) {
//                   return const Padding(
//                     padding: EdgeInsets.only(
//                       right: 5,
//                     ),
//                     child: Column(
//                       children: [
//                         CircleAvatar(
//                           radius: 42,
//                           backgroundColor: Colors.red,
//                           child: CircleAvatar(
//                             radius: 40,
//                             backgroundImage: AssetImage('assets/4.jpeg'),
//                           ),
//                         ),
//                         SizedBox(
//                           height: 5,
//                         ),
//                         Text('Story'),
//                       ],
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
