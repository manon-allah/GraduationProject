import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'widgets/custom_profile_body.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({
    super.key,
    required this.uId,
  });
  final String uId;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var userData = {};
  int postLength = 0;
  int followers = 0;
  int following = 0;
  bool isFollowing = false;

  @override
  void initState() {
    super.initState();
    getPostsLength();
  }

  getPostsLength() async {
    var userSnap = await FirebaseFirestore.instance
        .collection('users')
        .doc(widget.uId)
        .get();
    var postSnap = await FirebaseFirestore.instance
        .collection('posts')
        .where('uId', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();
    userData = userSnap.data()!;
    postLength = postSnap.docs.length;
    followers = userSnap.data()!['flowers'].length;
    following = userSnap.data()!['following'].length;
    isFollowing = userSnap
        .data()!['flowers']
        .contains(FirebaseAuth.instance.currentUser!.uid);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomProfileBody(),
    );
  }
}
