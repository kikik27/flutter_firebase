import 'package:dartz/dartz.dart';
import 'package:firebase_learn/core/error/faliures.dart';

abstract class AuthRepository {
  Future<Either<Failure, bool>> isLoggedIn();
}
