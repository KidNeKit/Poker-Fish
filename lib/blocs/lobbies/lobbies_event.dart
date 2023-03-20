part of 'lobbies_bloc.dart';

abstract class LobbiesEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchLobbies extends LobbiesEvent {}

class CashLobbyCreated extends LobbiesEvent {
  final List<CashLobby> cashLobbies;

  CashLobbyCreated({required this.cashLobbies});
}

class UpdateCashLobbiesRequested extends LobbiesEvent {}
