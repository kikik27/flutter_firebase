part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class Loading extends AuthState {
  final bool isloading;
  const Loading({required this.isloading});

  @override
  List<Object> get props => [isloading];
}

class AuthError extends AuthState {
  final String message;
  const AuthError({required this.message});

  @override
  List<Object> get props => [message];
}

class Authenticated extends AuthState {
  final User user;
  const Authenticated({required this.user});
}
