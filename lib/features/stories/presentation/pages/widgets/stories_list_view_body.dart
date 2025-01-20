import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram/features/auth/domain/entities/user_entity.dart';
import 'package:instagram/features/profile/presentation/domain/entities/profile_entity.dart';
import 'package:instagram/features/stories/presentation/pages/upload_story.dart';
import '../../../../auth/presentation/manager/cubit/auth_cubit.dart';

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
  List<String>? imgs = [];

  UserEntity? currentUser;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          Padding(
            padding: const EdgeInsets.only(
              left: 15,
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Column(
                    children: [
                      Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          CircleAvatar(
                            radius: 40,
                            backgroundImage: NetworkImage(
                              widget.user.imageProfileUrl.isNotEmpty
                                  ? widget.user.imageProfileUrl
                                  : 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR9SRRmhH4X5N2e4QalcoxVbzYsD44C-sQv-w&s',
                            ),
                          ),
                          CircleAvatar(
                            radius: 13,
                            backgroundColor: Colors.blue,
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => UploadStory(
                                      user: widget.user,
                                    ),
                                  ),
                                );
                              },
                              child: const Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(widget.user.userName.isNotEmpty
                          ? widget.user.userName
                          : 'UserName'),
                    ],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  ...List.generate(
                    10,
                    (index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                          right: 10,
                        ),
                        child: Column(
                          children: [
                            const CircleAvatar(
                              radius: 42,
                              backgroundColor: Colors.red,
                              child: CircleAvatar(
                                radius: 40,
                                backgroundImage: AssetImage('assets/4.jpeg'),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text('Story $index'),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
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
