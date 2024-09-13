part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthSignIn extends AuthEvent {
  final String email;
  final String password;

  const AuthSignIn(this.email, this.password);

  @override
  List<Object> get props => [email, password];
}

class AuthSignInGoogle extends AuthEvent {
  const AuthSignInGoogle();
  @override
  List<Object> get props => [];
}

class AuthSignOut extends AuthEvent {
  const AuthSignOut();
  @override
  List<Object> get props => [];
}

class CheckLoggedInEvent extends AuthEvent {
  const CheckLoggedInEvent();
  @override
  List<Object> get props => [];
}
