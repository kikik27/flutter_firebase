import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_learn/core/error/faliures.dart';
import 'package:firebase_learn/core/usecases/usecase.dart';
import 'package:firebase_learn/features/Auth/data/models/login_response_model.dart';
import 'package:firebase_learn/features/Auth/domain/repositories/auth_repository.dart';

class LoginUsecase implements UseCase<LoginResponseModel, LoginParams> {
  final AuthRepository repository;

  LoginUsecase({required this.repository});

  @override
  Future<Either<Failure, LoginResponseModel>> call(LoginParams params) async {
    return await repository.login(params.username, params.password);
  }
}

class LoginParams extends Equatable {
  final String username;
  final String password;

  const LoginParams({required this.username, required this.password});

  // coverage:ignore-start

  @override
  List<Object> get props => [username, password];
  // coverage:ignore-end
}
