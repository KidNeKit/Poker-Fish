import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/enums/auth_status.dart';
import '../../models/user.dart';
import '../../repositories/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;
  StreamSubscription<User>? _userSubscription;

  AuthBloc({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(const AuthState.unauthenticated()) {
    on<AuthUserChanged>(_onAuthUserChanged);
    on<AuthLogOutRequested>(_onAuthLogOutRequested);
  }

  void _onAuthUserChanged(AuthUserChanged event, Emitter<AuthState> emit) {
    emit(event.user.isEmpty
        ? const AuthState.unauthenticated()
        : AuthState.authenticated(event.user));
  }

  void _onAuthLogOutRequested(
      AuthLogOutRequested event, Emitter<AuthState> emit) {
    unawaited(_authRepository.signOut());
  }
}
