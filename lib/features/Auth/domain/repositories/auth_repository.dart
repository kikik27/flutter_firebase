import 'package:dartz/dartz.dart';
import 'package:firebase_learn/core/error/faliures.dart';
import 'package:firebase_learn/features/Auth/data/models/login_response_model.dart';
import 'package:firebase_learn/features/Auth/data/models/profile_response_model.dart';

abstract class AuthRepository {
  Future<Either<Failure, bool>> isLoggedIn();
  Future<Either<Failure, LoginResponseModel>> login(
      String email, String password);
  Future<Either<Failure, String>> getToken();
  Future<Either<Failure, bool>> setToken(String token);
  Future<Either<Failure, ProfileResponseModel>> getProfile();
}
