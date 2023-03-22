import 'package:equatable/equatable.dart';

class Player extends Equatable {
  final String _id;
  final String _username;
  final double _balance;

  const Player({
    required String id,
    required String username,
    required double balance,
  })  : _id = id,
        _username = username,
        _balance = balance;

  @override
  List<Object> get props => [_id, _username, _balance];

  Map<Object, dynamic> toMap() {
    return {
      'username': _username,
      'balance': _balance,
    };
  }

  @override
  String toString() {
    var map = toMap()..putIfAbsent('id', () => _id);
    return map.toString();
  }
}
