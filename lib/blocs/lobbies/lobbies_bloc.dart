import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/enums/operation_status.dart';
import '../../models/lobbies/cash_lobby.dart';
import '../../repositories/cash_lobby_repository.dart';

part 'lobbies_event.dart';
part 'lobbies_state.dart';

class LobbiesBloc extends Bloc<LobbiesEvent, LobbiesState> {
  final CashLobbyRepository _cashLobbyRepository = CashLobbyRepository();

  LobbiesBloc() : super(LobbiesState.initial()) {
    on<CashLobbyCreated>(onCashLobbyCreated);
    on<FetchLobbies>(onFetchLobbies);
    on<UpdateCashLobbiesRequested>(onUpdateCashLobbiesRequested);
  }

  void onCashLobbyCreated(
      CashLobbyCreated event, Emitter<LobbiesState> emit) async {
    log('creation of cash lobby');
    CashLobby lobby = await _cashLobbyRepository.createLobby();
    log('cash lobby created: ${lobby.toMap()}');
  }

  void onFetchLobbies(FetchLobbies event, Emitter<LobbiesState> emit) {
    log('searching lobbies in $_cashLobbyRepository');
    emit(state.copyWith(status: OperationStatus.loading));

    emit(state.copyWith(status: OperationStatus.successfull));
  }

  void onUpdateCashLobbiesRequested(
      UpdateCashLobbiesRequested event, Emitter<LobbiesState> emit) {
    log('searching lobbies in $_cashLobbyRepository');
    emit(state.copyWith(status: OperationStatus.loading));

    emit(state.copyWith(status: OperationStatus.successfull));
  }
}
