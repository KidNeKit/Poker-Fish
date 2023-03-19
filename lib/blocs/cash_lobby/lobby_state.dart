part of 'lobby_bloc.dart';

class CashLobbyState extends Equatable {
  final List<CashLobby> cashLobbiesList;
  final OperationStatus status;

  const CashLobbyState({required this.cashLobbiesList, required this.status});

  CashLobbyState.initial()
      : cashLobbiesList = [],
        status = OperationStatus.initial;

  CashLobbyState copyWith(
      {List<CashLobby>? cashLobbiesList, OperationStatus? status}) {
    return CashLobbyState(
        cashLobbiesList: cashLobbiesList ?? this.cashLobbiesList,
        status: status ?? this.status);
  }

  @override
  List<Object> get props => [cashLobbiesList, status];
}
