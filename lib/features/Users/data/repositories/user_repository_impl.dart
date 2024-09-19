import 'package:dartz/dartz.dart';
import 'package:firebase_learn/core/error/faliures.dart';
import 'package:firebase_learn/features/Users/data/datasources/user_remote_data_source.dart';
import 'package:firebase_learn/features/Users/domain/entities/user_entity.dart';
import 'package:firebase_learn/features/Users/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  late final UserRemoteDataSource userRemoteDataSource;
  @override
  Future<Either<Failure, List<UserEntity>>> getUserData() async {
    try {
      final data = await userRemoteDataSource.getUserRemoteData();
      return Right(data);
    } on Exception {
      return const Left(ServerFailure());
    }
  }
}
