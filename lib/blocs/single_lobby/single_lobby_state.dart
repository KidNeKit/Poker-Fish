part of 'single_lobby_bloc.dart';

class SingleLobbyState extends Equatable {
  final String? lobbyId;
  final OperationStatus status;

  const SingleLobbyState.initial()
      : lobbyId = null,
        status = OperationStatus.initial;

  const SingleLobbyState({required this.lobbyId, required this.status});

  SingleLobbyState copyWith({String? lobbyId, OperationStatus? status}) {
    return SingleLobbyState(
        lobbyId: lobbyId ?? this.lobbyId, status: status ?? this.status);
  }

  @override
  List<Object?> get props => [lobbyId, status];
}
