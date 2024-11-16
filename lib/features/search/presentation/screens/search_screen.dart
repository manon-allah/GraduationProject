import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';
import 'package:instagram/core/utils/app_router.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController searchController = TextEditingController();
  bool isShow = false;
  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextFormField(
          controller: searchController,
          onFieldSubmitted: (value) {
            setState(() {
              isShow = true;
            });
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
      body: isShow
          ? FutureBuilder(
              future: FirebaseFirestore.instance
                  .collection('users')
                  .where('userName',
                      isGreaterThanOrEqualTo: searchController.text)
                  .get(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.black,
                    ),
                  );
                }
                return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        if (FirebaseAuth.instance.currentUser!.uid ==
                            snapshot.data!.docs[index]['uId']) {
                          GoRouter.of(context)
                              .pushNamed(AppRouter.kProfileScreen);
                        } else {
                          GoRouter.of(context)
                              .pushNamed(AppRouter.kNewFollowerScreen);
                        }
                      },
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                            snapshot.data!.docs[index]['imageUrl'],
                          ),
                        ),
                        title: Text(snapshot.data!.docs[index]['userName']),
                        subtitle: Text(snapshot.data!.docs[index]['name']),
                      ),
                    );
                  },
                );
              },
            )
          : FutureBuilder(
              future: FirebaseFirestore.instance.collection('posts').get(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.black,
                    ),
                  );
                }
                return MasonryGridView.builder(
                    gridDelegate:
                        const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                    ),
                    itemCount: snapshot.data!.docs.length,
                    mainAxisSpacing: 2,
                    crossAxisSpacing: 2,
                    itemBuilder: (context, index) {
                      final doc = snapshot.data!.docs[index];
                      return Image.network(
                        doc['postUrl'],
                        fit: BoxFit.fill,
                      );
                    });
              },
            ),
    );
  }
}
