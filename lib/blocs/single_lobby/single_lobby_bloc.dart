import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/enums/operation_status.dart';
import '../../repositories/base_lobby_repository.dart';

part 'single_lobby_event.dart';
part 'single_lobby_state.dart';

class SingleLobbyBloc extends Bloc<SingleLobbyEvent, SingleLobbyState> {
  final BaseLobbyRepository _lobbyRepository;

  SingleLobbyBloc({required BaseLobbyRepository lobbyRepository})
      : _lobbyRepository = lobbyRepository,
        super(const SingleLobbyState.initial()) {
    log('created table bloc with $_lobbyRepository');
    on<LobbySelected>(onLobbySelected);
    on<LobbyJoined>(onLobbyJoined);
    on<LobbyExited>(onLobbyExited);
  }

  void onLobbySelected(LobbySelected event, Emitter<SingleLobbyState> emit) {
    emit(state.copyWith(
        lobbyId: event.lobbyId, status: OperationStatus.loading));

    emit(state.copyWith(status: OperationStatus.successfull));
  }

  void onLobbyJoined(LobbyJoined event, Emitter<SingleLobbyState> emit) async {
    log('User ${event.playerId} joining lobby ${event.lobbyId}');
    emit(state.copyWith(status: OperationStatus.loading));
    await _lobbyRepository.joinPlayerToLobby(event.lobbyId, event.playerId);
    emit(state.copyWith(status: OperationStatus.successfull));
  }

  void onLobbyExited(LobbyExited event, Emitter<SingleLobbyState> emit) async {
    log('User ${event.playerId} exiting lobby ${event.lobbyId}');
    emit(state.copyWith(status: OperationStatus.loading));
    await _lobbyRepository.removePlayerFromLobby(event.lobbyId, event.playerId);
    emit(state.copyWith(status: OperationStatus.successfull));
  }
}
