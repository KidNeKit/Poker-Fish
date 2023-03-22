import 'package:equatable/equatable.dart';

class Player extends Equatable {
  final String _id;
  final String _username;
  final double _balance;
  final int _order;

  const Player({
    required String id,
    required String username,
    required double balance,
    required int order,
  })  : _id = id,
        _username = username,
        _balance = balance,
        _order = order;

  Player.fromMap(Map<String, dynamic> map, String id)
      : _id = id,
        _username = map['username'],
        _balance = map['balance'],
        _order = map['order'];

  String get id => _id;
  int get order => _order;

  @override
  List<Object> get props => [_id, _username, _balance, _order];

  Map<String, dynamic> toMap() {
    return {
      'username': _username,
      'balance': _balance,
      'order': _order,
    };
  }

  @override
  String toString() {
    var map = toMap()..putIfAbsent('id', () => _id);
    return map.toString();
  }
}
