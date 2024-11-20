import 'package:flutter/material.dart';

import 'widgets/custom_search_body.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomSearchBody(),
      // isShow
      //     ? FutureBuilder(
      //         future: FirebaseFirestore.instance
      //             .collection('users')
      //             .where('userName',
      //                 isGreaterThanOrEqualTo: searchController.text)
      //             .get(),
      //         builder: (context, snapshot) {
      //           if (snapshot.connectionState == ConnectionState.waiting) {
      //             return const Center(
      //               child: CircularProgressIndicator(
      //                 color: Colors.black,
      //               ),
      //             );
      //           }
      //           return ListView.builder(
      //             itemCount: snapshot.data!.docs.length,
      //             itemBuilder: (context, index) {
      //               return InkWell(
      //                 onTap: () {
      //                   GoRouter.of(context)
      //                       .pushNamed(AppRouter.kProfileScreen);
      //                 },
      //                 child: ListTile(
      //                   leading: CircleAvatar(
      //                     backgroundImage: NetworkImage(
      //                       snapshot.data!.docs[index]['imageUrl'],
      //                     ),
      //                   ),
      //                   title: Text(snapshot.data!.docs[index]['userName']),
      //                   subtitle: Text(snapshot.data!.docs[index]['name']),
      //                 ),
      //               );
      //             },
      //           );
      //         },
      //       )
      //     : FutureBuilder(
      //         future: FirebaseFirestore.instance
      //             .collection('posts')
      //             .where('uId',
      //                 isEqualTo: FirebaseAuth.instance.currentUser!.uid)
      //             .get(),
      //         builder: (context, snapshot) {
      //           if (!snapshot.hasData) {
      //             return const Center(
      //               child: CircularProgressIndicator(
      //                 color: Colors.black,
      //               ),
      //             );
      //           }
      //           return MasonryGridView.builder(
      //               gridDelegate:
      //                   const SliverSimpleGridDelegateWithFixedCrossAxisCount(
      //                 crossAxisCount: 3,
      //               ),
      //               itemCount: snapshot.data!.docs.length,
      //               mainAxisSpacing: 2,
      //               crossAxisSpacing: 2,
      //               itemBuilder: (context, index) {
      //                 final doc = snapshot.data!.docs[index];
      //                 return Image.network(
      //                   doc['postUrl'],
      //                   fit: BoxFit.fill,
      //                 );
      //               });
      //         },
      //       ),
    );
  }
}
