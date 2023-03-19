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
