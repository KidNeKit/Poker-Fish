import '../enums/blinds.dart';
import '../enums/game_speed.dart';
import '../player.dart';

abstract class BaseLobby {
  String? _lobbyId;
  final int _maxPlayers;
  final double _buyIn;
  final GameSpeed _gameSpeed;
  Blinds _blinds;
  List<Player> _players;

  BaseLobby(
      {required String? lobbyId,
      required int maxPlayers,
      required double buyIn,
      required Blinds blinds,
      GameSpeed gameSpeed = GameSpeed.normal,
      List<Player>? players})
      : _lobbyId = lobbyId,
        _maxPlayers = maxPlayers,
        _buyIn = buyIn,
        _blinds = blinds,
        _gameSpeed = gameSpeed,
        _players = players ?? [];

  BaseLobby.creation(
      {required int maxPlayers,
      required double buyIn,
      required Blinds blinds,
      GameSpeed gameSpeed = GameSpeed.normal})
      : this(
          lobbyId: null,
          maxPlayers: maxPlayers,
          buyIn: buyIn,
          blinds: blinds,
          gameSpeed: gameSpeed,
        );

  String get lobbyId => _lobbyId!;
  int get maxPlayers => _maxPlayers;
  double get buyIn => _buyIn;
  Blinds get blinds => _blinds;
  GameSpeed get gameSpeed => _gameSpeed;
  List<Player> get players => _players;

  set setLobbyId(String lobbyId) => _lobbyId = lobbyId;

  Map<String, Object?> toMap() {
    return {
      'maxPlayers': _maxPlayers,
      'buyIn': _buyIn,
      'blinds': _blinds.name,
      'gameSpeed': _gameSpeed.name,
      'players': _players,
    };
  }

  @override
  String toString() {
    var map = toMap()..putIfAbsent('id', () => _lobbyId);
    return map.toString();
  }
}
