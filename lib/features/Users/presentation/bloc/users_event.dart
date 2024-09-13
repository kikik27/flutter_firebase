part of 'users_bloc.dart';

abstract class UsersEvent extends Equatable {
  const UsersEvent();

  @override
  List<Object> get props => [];
}

class GetUserEvent extends UsersEvent {
  final String userId;

  const GetUserEvent({required this.userId});

  @override
  List<Object> get props => [userId];
}
