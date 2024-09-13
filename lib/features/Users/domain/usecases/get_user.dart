import 'package:dartz/dartz.dart';
import 'package:firebase_learn/core/error/faliures.dart';
import 'package:firebase_learn/core/usecases/usecase.dart';
import 'package:firebase_learn/features/Users/domain/entities/user_entity.dart';
import 'package:firebase_learn/features/Users/domain/repositories/user_repository.dart';

class GetUsers implements UseCase<List<UserEntity>, String?> {
  late final UserRepository repository;
  @override
  Future<Either<Failure, List<UserEntity>>> call(String? params) async {
    return await repository.getUserData();
  }
}
