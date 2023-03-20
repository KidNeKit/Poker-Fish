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
    emit(state.copyWith(status: OperationStatus.loading));
    for (CashLobby lobby in event.cashLobbies) {
      CashLobby createdLobby = await _cashLobbyRepository.createLobby(lobby);
      log('cash lobby created: ${createdLobby.toMap()}');
    }
    add(FetchLobbies());
  }

  void onFetchLobbies(FetchLobbies event, Emitter<LobbiesState> emit) async {
    log('searching lobbies in $_cashLobbyRepository');
    emit(state.copyWith(status: OperationStatus.loading));
    List<CashLobby> lobbies = await _cashLobbyRepository.getAllLobbies();
    emit(state.copyWith(
        status: OperationStatus.successfull, cashLobbiesList: lobbies));
  }

  void onUpdateCashLobbiesRequested(
      UpdateCashLobbiesRequested event, Emitter<LobbiesState> emit) {
    log('searching lobbies in $_cashLobbyRepository');
    emit(state.copyWith(status: OperationStatus.loading));

    emit(state.copyWith(status: OperationStatus.successfull));
  }
}
