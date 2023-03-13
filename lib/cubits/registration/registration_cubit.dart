import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/enums/operation_status.dart';
import '../../repositories/auth_repository.dart';

part 'registration_state.dart';

class RegistrationCubit extends Cubit<RegistrationState> {
  final AuthRepository _authRepository;

  RegistrationCubit({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(const RegistrationState.initial());

  void emailChanged(String email) {
    emit(state.copyWith(
      email: email,
      status: OperationStatus.initial,
    ));
  }

  void passwordChanged(String password) {
    emit(state.copyWith(
      password: password,
      status: OperationStatus.initial,
    ));
  }

  Future<void> signUpWithEmailAndPassword() async {
    if (state.status == OperationStatus.loading) return;
    emit(state.copyWith(status: OperationStatus.loading));
    try {
      await _authRepository.signUp(
          email: state.email, password: state.password);
      emit(state.copyWith(
        email: '',
        password: '',
        status: OperationStatus.successfull,
      ));
    } catch (e) {
      log('An Error in signUpWithEmailAndPassword of RegistrationCubit: $e');
      emit(state.copyWith(
        password: '',
        status: OperationStatus.failed,
      ));
    }
  }
}
