import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_learn/features/Users/domain/entities/user_entity.dart';

part 'users_event.dart';
part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  UsersBloc() : super(UsersInitial()) {
    on<GetUserEvent>(_onGetUserData);
  }

  Future<void> _onGetUserData(
      GetUserEvent event, Emitter<UsersState> emit) async {
    emit(state.copyWith(isLoading: true));

    try {} catch (e) {
      emit(state.copyWith(isLoading: false));
      emit(state.copyWith(messages: e.toString()));
    }
  }
}
