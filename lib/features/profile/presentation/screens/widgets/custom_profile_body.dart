import 'package:flutter/material.dart';

import 'custom_app_bar_profile.dart';
import 'custom_photo_posts_followers.dart';
import 'custom_user_name_edit.dart';

class CustomProfileBody extends StatelessWidget {
  const CustomProfileBody({
    super.key,
    required this.userData,
    required this.postLength,
    required this.followers,
    required this.following,
    required this.isFollowing,
  });
  final Map<String, dynamic> userData;
  final int postLength;
  final int followers;
  final int following;
  final bool isFollowing;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ////////////////////////////////////////////////////
              // app bar
              ///////////////////////////////////////////////////
              CustomAppBarProfile(
                userName: userData['userName'],
              ),
              const SizedBox(
                height: 15,
              ),
              /////////////////////////////////////////////
              // photo and number of posts.....etc
              /////////////////////////////////////////////
              CustomPhotoPostsFollowers(
                postLength: postLength,
                followers: followers,
                following: following,
                isFollowing: isFollowing,
                photoUrl: userData['imageUrl'],
              ),
              const SizedBox(
                height: 10,
              ),
              ////////////////////////////////////////////
              // user name button edit....etc
              ///////////////////////////////////////////
              CustomUserNameEdit(
                userData: userData,
              ),
              // FutureBuilder(
              //     future: FirebaseFirestore.instance
              //         .collection('posts')
              //         .where('uId', isEqualTo: widget.uId)
              //         .get(),
              //     builder: (context, snapshot) {
              //       if (snapshot.connectionState == ConnectionState.waiting) {
              //         return const Center(
              //           child: CircularProgressIndicator(),
              //         );
              //       }
              //       return GridView.builder(
              //         gridDelegate:
              //             const SliverGridDelegateWithFixedCrossAxisCount(
              //           crossAxisCount: 3,
              //           mainAxisSpacing: 2,
              //           crossAxisSpacing: 2,
              //         ),
              //         itemCount: snapshot.data!.docs.length,
              //         itemBuilder: (context, index) {
              //           DocumentSnapshot snap = snapshot.data!.docs[index];
              //           return Container(
              //             child: Image(
              //               image: NetworkImage(
              //                 snap['postUrl'],
              //               ),
              //               fit: BoxFit.fill,
              //             ),
              //           );
              //         },
              //       );
              //     }),
            ],
          ),
        ),
      ),
    );
  }
}
