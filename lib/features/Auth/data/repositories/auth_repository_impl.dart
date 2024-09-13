import 'package:dartz/dartz.dart';
import 'package:firebase_learn/core/error/faliures.dart';
import 'package:firebase_learn/features/Auth/data/datasources/auth_local_data_source.dart';
import 'package:firebase_learn/features/Auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthLocalDataSource authLocalDataSource;
  AuthRepositoryImpl({required this.authLocalDataSource});

  @override
  Future<Either<Failure, bool>> isLoggedIn() async {
    try {
      final result = await authLocalDataSource.isLoggedIn();
      return Right(result);
    } on Exception {
      return const Left(ServerFailure());
    }
  }
}
