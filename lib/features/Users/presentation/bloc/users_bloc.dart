import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_learn/core/helpers/logger.dart';
import 'package:firebase_learn/features/Users/domain/entities/user_entity.dart';
import 'package:firebase_learn/features/Users/domain/usecases/get_user.dart';

part 'users_event.dart';
part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  final GetUsers _getUsers;

  UsersBloc(this._getUsers) : super(UsersInitial()) {
    on<GetUserEvent>((event, state) => _onGetUserData(event, state));
  }

  FutureOr<void> _onGetUserData(
      GetUserEvent event, Emitter<UsersState> emit) async {
    emit(state.copyWith(isLoading: true));

    try {
      final data = await _getUsers('123');
      data.fold((failure) {
        emit(state.copyWith(messages: failure.message.toString()));
      }, (success) {
        logger.i("$success: ${success.length}");
        emit(state.copyWith(messages: null, users: success));
      });
    } catch (e) {
      emit(state.copyWith(messages: e.toString()));
    }
  }
}
