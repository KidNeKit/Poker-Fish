import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/enums/operation_status.dart';
import '../../models/lobbies/cash_lobby.dart';
import '../../repositories/cash_lobby_repository.dart';

part 'lobby_event.dart';
part 'lobby_state.dart';

class LobbyBloc extends Bloc<LobbyEvent, CashLobbyState> {
  final CashLobbyRepository _cashLobbyRepository = CashLobbyRepository();

  LobbyBloc() : super(CashLobbyState.initial()) {
    on<FetchLobbies>(onFetchLobbies);
    on<UpdateCashLobbiesRequested>(onUpdateCashLobbiesRequested);
  }

  void onFetchLobbies(FetchLobbies event, Emitter<CashLobbyState> emit) {
    log('searching lobbies in $_cashLobbyRepository');
    emit(state.copyWith(status: OperationStatus.loading));

    emit(state.copyWith(status: OperationStatus.successfull));
  }

  void onUpdateCashLobbiesRequested(
      UpdateCashLobbiesRequested event, Emitter<CashLobbyState> emit) {
    log('searching lobbies in $_cashLobbyRepository');
    emit(state.copyWith(status: OperationStatus.loading));

    emit(state.copyWith(status: OperationStatus.successfull));
  }
}
