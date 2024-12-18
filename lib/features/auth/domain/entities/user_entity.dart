class UserEntity {
  final String uid;
  final String password;
  final String email;

  UserEntity({
    required this.uid,
    required this.password,
    required this.email,
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'password': password,
      'email': email,
    };
  }

  factory UserEntity.fromMap(Map<String, dynamic> map) {
    return UserEntity(
      uid: map['uid'],
      password: map['password'],
      email: map['email'],
    );
  }
}
