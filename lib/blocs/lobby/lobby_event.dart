part of 'lobby_bloc.dart';

abstract class LobbyEvent extends Equatable {
  final List<BaseLobby> lobbiesList;

  LobbyEvent() : lobbiesList = [];

  @override
  List<Object> get props => [lobbiesList];
}

class LobbiesRequested extends LobbyEvent {}

class CashLobbiesRequested extends LobbyEvent {
  final BaseLobbyRepository lobbyRepository = CashLobbyRepository();
}
