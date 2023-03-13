part of 'registration_cubit.dart';

class RegistrationState extends Equatable {
  final String email;
  final String password;
  final OperationStatus status;

  const RegistrationState(
      {required this.email, required this.password, required this.status});

  const RegistrationState.initial()
      : email = '',
        password = '',
        status = OperationStatus.initial;

  RegistrationState copyWith({
    String? email,
    String? password,
    OperationStatus? status,
  }) {
    return RegistrationState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [email, password, status];
}
