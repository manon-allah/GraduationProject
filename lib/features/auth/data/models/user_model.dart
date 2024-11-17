class UserModel {
  final String uid;
  final String password;
  final String email;
  final String name;
  final String userName;
  final String website;
  final String bio;
  final String phone;
  final String gender;
  final String imageUrl;
  final List followers;
  final List following;

  UserModel({
    required this.uid,
    required this.password,
    required this.email,
    required this.name,
    required this.userName,
    required this.website,
    required this.bio,
    required this.phone,
    required this.gender,
    required this.imageUrl,
    required this.followers,
    required this.following,
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'password': password,
      'email': email,
      'name': name,
      'userName': userName,
      'website': website,
      'bio': bio,
      'phone': phone,
      'gender': gender,
      'imageUrl': imageUrl,
      'flowers': followers,
      'following': following,
    };
  }
}
