import 'dart:async';
import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/enums/operation_status.dart';
import '../../models/player.dart';
import '../../repositories/base_lobby_repository.dart';
import '../auth/auth_bloc.dart';

part 'single_lobby_event.dart';
part 'single_lobby_state.dart';

class SingleLobbyBloc extends Bloc<SingleLobbyEvent, SingleLobbyState> {
  final BaseLobbyRepository _lobbyRepository;
  final AuthBloc _authBloc;

  late StreamSubscription<List<Player>> _playerSubscription;

  SingleLobbyBloc(
      {required BaseLobbyRepository lobbyRepository,
      required AuthBloc authBloc})
      : _lobbyRepository = lobbyRepository,
        _authBloc = authBloc,
        super(const SingleLobbyState.initial()) {
    log('created table bloc with $_lobbyRepository');

    on<LobbySelected>(onLobbySelected);
    on<LobbyJoined>(onLobbyJoined);
    on<LobbyExited>(onLobbyExited);
  }

  void onLobbySelected(LobbySelected event, Emitter<SingleLobbyState> emit) {
    emit(state.copyWith(
        lobbyId: event.lobbyId, status: OperationStatus.loading));

    _playerSubscription = _lobbyRepository
        .getPlayersChangesStream(event.lobbyId)
        .listen((players) =>
            log('Players of lobby ${event.lobbyId} were updated: $players'));

    emit(state.copyWith(status: OperationStatus.successfull));
  }

  void onLobbyJoined(LobbyJoined event, Emitter<SingleLobbyState> emit) async {
    log('User ${event.playerId} joining lobby ${event.lobbyId}');
    emit(state.copyWith(status: OperationStatus.loading));

    Player player = Player(
        id: event.playerId,
        username: _authBloc.state.user.username,
        balance: _authBloc.state.user.balance,
        order: 1);
    await _lobbyRepository.joinPlayerToLobby(event.lobbyId, player);
    emit(state.copyWith(status: OperationStatus.successfull));
  }

  void onLobbyExited(LobbyExited event, Emitter<SingleLobbyState> emit) async {
    log('User ${event.playerId} exiting lobby ${event.lobbyId}');
    emit(state.copyWith(status: OperationStatus.loading));
    await _lobbyRepository.removePlayerFromLobby(event.lobbyId, event.playerId);
    emit(state.copyWith(status: OperationStatus.successfull));
  }

  @override
  Future<void> close() {
    _playerSubscription.cancel();
    return super.close();
  }
}
