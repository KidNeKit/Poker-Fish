import '../enums/game_speed.dart';

abstract class BaseLobby {
  final int _maxPlayers;
  final double _buyIn;
  final GameSpeed _gameSpeed;

  BaseLobby(
      {required int maxPlayers,
      required double buyIn,
      GameSpeed gameSpeed = GameSpeed.normal})
      : _maxPlayers = maxPlayers,
        _buyIn = buyIn,
        _gameSpeed = gameSpeed;

  int get maxPlayers => _maxPlayers;
  double get buyIn => _buyIn;
  GameSpeed get gameSpeed => _gameSpeed;
}
