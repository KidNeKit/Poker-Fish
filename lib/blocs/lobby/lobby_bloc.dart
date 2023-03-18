import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/enums/operation_status.dart';
import '../../models/lobbies/base_lobby.dart';
import '../../repositories/base_lobby_repository.dart';
import '../../repositories/cash_lobby_repository.dart';

part 'lobby_event.dart';
part 'lobby_state.dart';

class LobbyBloc extends Bloc<LobbyEvent, LobbyState> {
  final BaseLobbyRepository _lobbyRepository;

  LobbyBloc({required BaseLobbyRepository lobbyRepository})
      : _lobbyRepository = lobbyRepository,
        super(LobbyState.initial()) {
    on<LobbiesRequested>(onLobbiesRequested);
    on<CashLobbiesRequested>(onCashLobbiesRequested);
  }

  void onLobbiesRequested(LobbiesRequested event, Emitter<LobbyState> emit) {
    log('searching lobbies in $_lobbyRepository');
    emit(state.copyWith(status: OperationStatus.loading));

    emit(state.copyWith(status: OperationStatus.successfull));
  }

  void onCashLobbiesRequested(
      CashLobbiesRequested event, Emitter<LobbyState> emit) {
    log('searching lobbies in $_lobbyRepository');
    emit(state.copyWith(status: OperationStatus.loading));

    emit(state.copyWith(status: OperationStatus.successfull));
  }
}
