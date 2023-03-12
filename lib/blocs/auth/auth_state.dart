part of 'auth_bloc.dart';

class AuthState extends Equatable {
  final AuthStatus authStatus;
  final User user;

  const AuthState._({required this.authStatus, this.user = const User.empty()});

  const AuthState.authenticated(User user)
      : this._(authStatus: AuthStatus.authenticated, user: user);

  const AuthState.unauthenticated()
      : this._(authStatus: AuthStatus.unauthenticated);

  @override
  List<Object> get props => [authStatus, user];
}
