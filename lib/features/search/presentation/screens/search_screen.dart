import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

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
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                          snapshot.data!.docs[index]['imageUrl'],
                        ),
                      ),
                      title: Text(snapshot.data!.docs[index]['userName']),
                      subtitle: Text(snapshot.data!.docs[index]['name']),
                    );
                  },
                );
              },
            )
          : const Center(
              child: Text('posts'),
            ),
    );
  }
}
