part of 'lobby_bloc.dart';

class LobbyState extends Equatable {
  final List<BaseLobby> lobbiesList;
  final OperationStatus status;

  const LobbyState({required this.lobbiesList, required this.status});

  LobbyState.initial()
      : lobbiesList = [],
        status = OperationStatus.initial;

  LobbyState copyWith({List<BaseLobby>? lobbiesList, OperationStatus? status}) {
    return LobbyState(
        lobbiesList: lobbiesList ?? this.lobbiesList,
        status: status ?? this.status);
  }

  @override
  List<Object> get props => [lobbiesList, status];
}
