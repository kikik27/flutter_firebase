part of 'users_bloc.dart';

class UsersState extends Equatable {
  final bool isLoading;
  final bool isLoadingQuery;
  final List<UserEntity> users;
  final String? messages;

  const UsersState({
    this.isLoading = false,
    this.isLoadingQuery = false,
    this.users = const [],
    this.messages,
  });

  @override
  List<Object?> get props => [isLoading, isLoadingQuery, messages];

  UsersState copyWith({
    bool? isLoading,
    bool? isLoadingQuery,
    List<UserEntity>? users,
    String? messages,
  }) {
    return UsersState(
      isLoading: isLoading ?? this.isLoading,
      isLoadingQuery: isLoadingQuery ?? this.isLoadingQuery,
      users: users ?? this.users,
      messages: messages ?? this.messages,
    );
  }
}

class UsersInitial extends UsersState {}
