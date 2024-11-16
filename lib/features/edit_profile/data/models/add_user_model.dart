import 'package:cloud_firestore/cloud_firestore.dart';

class AddUserModel {
  final String uId;
  final String name;
  final String userName;
  final String website;
  final String bio;
  final String email;
  final String phone;
  final String gender;
  final String imageUrl;
  final List flowers;
  final List following;

  AddUserModel({
    required this.uId,
    required this.name,
    required this.userName,
    required this.website,
    required this.bio,
    required this.email,
    required this.phone,
    required this.gender,
    required this.imageUrl,
    required this.flowers,
    required this.following,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'uId': uId,
      'userName': userName,
      'website': website,
      'bio': bio,
      'email': email,
      'phone': phone,
      'gender': gender,
      'imageUrl': imageUrl,
      'flowers': flowers,
      'following': following,
    };
  }

  //
  static AddUserModel fromSnapshot(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return AddUserModel(
      name: snapshot['name'],
      uId: snapshot['uId'],
      userName: snapshot['userName'],
      website: snapshot['website'],
      bio: snapshot['bio'],
      email: snapshot['email'],
      phone: snapshot['phone'],
      gender: snapshot['gender'],
      imageUrl: snapshot['imageUrl'],
      flowers: snapshot['flowers'],
      following: snapshot['following'],
    );
  }
}
