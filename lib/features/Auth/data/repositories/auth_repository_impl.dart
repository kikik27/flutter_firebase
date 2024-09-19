import 'package:dartz/dartz.dart';
import 'package:firebase_learn/core/error/faliures.dart';
import 'package:firebase_learn/features/Auth/data/datasources/auth_local_data_source.dart';
import 'package:firebase_learn/features/Auth/data/datasources/auth_remote_data_source.dart';
import 'package:firebase_learn/features/Auth/data/models/login_response_model.dart';
import 'package:firebase_learn/features/Auth/data/models/profile_response_model.dart';
import 'package:firebase_learn/features/Auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthLocalDataSource authLocalDataSource;
  final AuthRemoteDataSource authRemoteDataSource;

  AuthRepositoryImpl(
      {required this.authLocalDataSource, required this.authRemoteDataSource});

  @override
  Future<Either<Failure, bool>> isLoggedIn() async {
    try {
      final result = await authLocalDataSource.isLoggedIn();
      return Right(result);
    } on Exception {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, LoginResponseModel>> login(
      String username, String password) async {
    try {
      Map<String, dynamic> data = {"username": username, "password": password};
      final result = await authRemoteDataSource.login(data);
      return Right(result);
    } on Exception {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, String>> getToken() async {
    try {
      final result = await authLocalDataSource.getToken();

      return Right(result);
    } on Exception {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> setToken(String token) async {
    try {
      final result = await authLocalDataSource.setToken(token);
      return Right(result);
    } on Exception {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, ProfileResponseModel>> getProfile() async {
    try {
      final response = await authRemoteDataSource.getProfile();
      return Right(response);
    } on Exception {
      return const Left(ServerFailure());
    }
  }
}
