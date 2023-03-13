import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

class User extends Equatable {
  final String _id;
  final String? _username;
  final String? _email;

  const User(
      {required String id, required String username, required String email})
      : _id = id,
        _username = username,
        _email = email;

  const User.empty()
      : _id = '',
        _username = null,
        _email = null;

  User.fromFirebaseUser(auth.User firebaseUser)
      : _id = firebaseUser.uid,
        _username = firebaseUser.displayName ?? '',
        _email = firebaseUser.email ?? '';

  bool get isEmpty => this == const User.empty();

  @override
  List<Object?> get props => [_id, _username, _email];

  static User fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      username: json['username'],
      email: json['email'],
    );
  }

  String toJson() {
    return {
      'id': _id,
      'username': _username,
      'email': _email,
    }.toString();
  }

  @override
  String toString() {
    return toJson();
  }
}
