import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/enums/operation_status.dart';
import '../../repositories/auth_repository.dart';
import '../../validators/auth_validator.dart';

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
    emit(state.copyWith(
      status: OperationStatus.loading,
      errors: {},
    ));
    AuthValidator authValidator =
        AuthValidator(email: state.email, password: state.password);
    var results = authValidator.getValidationResults();
    log(results.toString());
    if (results.isNotEmpty) {
      emit(state.copyWith(
        errors: results,
        status: OperationStatus.failed,
      ));
      return;
    }
    try {
      await _authRepository.logInWithEmailAndPassword(
          email: state.email, password: state.password);
      emit(state.copyWith(
        email: '',
        password: '',
        errors: {},
        status: OperationStatus.successfull,
      ));
    } on FirebaseAuthException catch (e) {
      log('firebase exception: $e');
      emit(state.copyWith(
        errors: authValidator.getErrorMessage(e.message!),
        status: OperationStatus.failed,
      ));
    } catch (e) {
      log('An Error in logInWithEmailAndPassword of LoginCubit: $e');
      emit(state.copyWith(
        errors: authValidator.getErrorMessage(e.toString()),
        status: OperationStatus.failed,
      ));
    }
  }
}
