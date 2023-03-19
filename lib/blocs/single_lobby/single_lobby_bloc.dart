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
  }

  void onLobbySelected(LobbySelected event, Emitter<SingleLobbyState> emit) {
    emit(state.copyWith(
        lobbyId: event.lobbyId, status: OperationStatus.loading));

    emit(state.copyWith(status: OperationStatus.successfull));
  }
}
