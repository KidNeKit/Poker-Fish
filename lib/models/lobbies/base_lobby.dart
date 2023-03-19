import '../enums/game_speed.dart';

abstract class BaseLobby {
  String? _lobbyId;
  final int _maxPlayers;
  final double _buyIn;
  final GameSpeed _gameSpeed;

  BaseLobby(
      {required String? lobbyId,
      required int maxPlayers,
      required double buyIn,
      GameSpeed gameSpeed = GameSpeed.normal})
      : _lobbyId = lobbyId,
        _maxPlayers = maxPlayers,
        _buyIn = buyIn,
        _gameSpeed = gameSpeed;

  BaseLobby.creation(
      {required int maxPlayers,
      required double buyIn,
      GameSpeed gameSpeed = GameSpeed.normal})
      : this(
            lobbyId: null,
            maxPlayers: maxPlayers,
            buyIn: buyIn,
            gameSpeed: gameSpeed);

  String get lobbyId => _lobbyId!;
  int get maxPlayers => _maxPlayers;
  double get buyIn => _buyIn;
  GameSpeed get gameSpeed => _gameSpeed;

  set setLobbyId(String lobbyId) => _lobbyId = lobbyId;

  Map<String, Object?> toMap() {
    return {
      'maxPlayers': _maxPlayers,
      'buyIn': _buyIn,
      'gameSpeed': _gameSpeed.name,
    };
  }

  @override
  String toString() {
    var map = toMap()..putIfAbsent('id', () => lobbyId);
    return map.toString();
  }
}
