import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/enums/operation_status.dart';
import '../../repositories/auth_repository.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepository _authRepository;

  LoginCubit({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(const LoginState.initial());

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

  Future<void> logInWithEmailAndPassword() async {
    if (state.status == OperationStatus.loading) return;
    emit(state.copyWith(status: OperationStatus.loading));
    try {
      await _authRepository.logInWithEmailAndPassword(
          email: state.email, password: state.password);
      emit(state.copyWith(
        email: '',
        password: '',
        status: OperationStatus.successfull,
      ));
    } catch (e) {
      log('An Error in logInWithEmailAndPassword of LoginCubit: $e');
      emit(state.copyWith(
        password: '',
        status: OperationStatus.failed,
      ));
    }
  }
}
