
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_learn/core/error/faliures.dart';
import 'package:firebase_learn/core/usecases/usecase.dart';
import 'package:firebase_learn/features/Auth/domain/repositories/auth_repository.dart';
class IsLoggedIn implements UseCase<bool, NoParams> {
  final AuthRepository repository;

  IsLoggedIn(this.repository);

  @override
  Future<Either<Failure, bool>> call(NoParams params) async {
    final response = await repository.isLoggedIn();
    return response;
  }
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
