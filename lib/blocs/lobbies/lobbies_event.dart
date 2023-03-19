part of 'lobbies_bloc.dart';

abstract class LobbiesEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchLobbies extends LobbiesEvent {}

class CashLobbyCreated extends LobbiesEvent {}

class UpdateCashLobbiesRequested extends LobbiesEvent {}
