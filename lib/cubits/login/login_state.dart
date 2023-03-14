part of 'login_cubit.dart';

class LoginState extends Equatable {
  final String email;
  final String password;
  final Map<String, String> errors;
  final OperationStatus status;

  const LoginState(
      {required this.email,
      required this.password,
      required this.status,
      required this.errors});

  const LoginState.initial()
      : email = '',
        password = '',
        errors = const {},
        status = OperationStatus.initial;

  LoginState copyWith({
    String? email,
    String? password,
    Map<String, String>? errors,
    OperationStatus? status,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
      errors: errors ?? this.errors,
    );
  }

  @override
  List<Object> get props => [email, password, status, errors];
}
