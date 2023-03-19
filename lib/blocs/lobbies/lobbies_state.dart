part of 'lobbies_bloc.dart';

class LobbiesState extends Equatable {
  final List<CashLobby> cashLobbiesList;
  final OperationStatus status;

  const LobbiesState({required this.cashLobbiesList, required this.status});

  LobbiesState.initial()
      : cashLobbiesList = [],
        status = OperationStatus.initial;

  LobbiesState copyWith(
      {List<CashLobby>? cashLobbiesList, OperationStatus? status}) {
    return LobbiesState(
        cashLobbiesList: cashLobbiesList ?? this.cashLobbiesList,
        status: status ?? this.status);
  }

  @override
  List<Object> get props => [cashLobbiesList, status];
}
