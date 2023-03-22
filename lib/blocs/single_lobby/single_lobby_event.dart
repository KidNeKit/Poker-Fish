part of 'single_lobby_bloc.dart';

abstract class SingleLobbyEvent extends Equatable {
  const SingleLobbyEvent();

  @override
  List<Object> get props => [];
}

class LobbySelected extends SingleLobbyEvent {
  final String lobbyId;

  const LobbySelected({required this.lobbyId});

  @override
  List<Object> get props => [lobbyId];
}

class LobbyJoined extends SingleLobbyEvent {
  final String lobbyId;
  final String playerId;

  const LobbyJoined({required this.lobbyId, required this.playerId});

  @override
  List<Object> get props => [lobbyId, playerId];
}

class LobbyExited extends SingleLobbyEvent {
  final String lobbyId;
  final String playerId;

  const LobbyExited({required this.lobbyId, required this.playerId});

  @override
  List<Object> get props => [lobbyId, playerId];
}
