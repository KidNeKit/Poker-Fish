import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String _id;
  final String? _username;
  final String? _email;
  final double _balance;

  const User(
      {required String id,
      required String username,
      required String email,
      double balance = 0.0})
      : _id = id,
        _username = username,
        _email = email,
        _balance = balance;

  const User.empty()
      : _id = '',
        _username = null,
        _email = null,
        _balance = 0.0;

  bool get isEmpty => this == const User.empty();
  String get id => _id;
  String get username => _username ?? '';
  double get balance => _balance;

  @override
  List<Object?> get props => [_id, _username, _email, _balance];

  static User fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      username: json['username'],
      email: json['email'],
      balance: json['balance'] ?? 0.0,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': _id,
      'username': _username,
      'email': _email,
      'balance': _balance,
    };
  }

  String toJson() {
    return toMap().toString();
  }

  @override
  String toString() {
    return toJson();
  }
}
