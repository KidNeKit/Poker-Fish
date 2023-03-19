part of 'lobby_bloc.dart';

abstract class LobbyEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchLobbies extends LobbyEvent {}

class UpdateCashLobbiesRequested extends LobbyEvent {}
