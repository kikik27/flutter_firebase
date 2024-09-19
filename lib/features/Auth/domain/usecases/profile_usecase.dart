import 'package:dartz/dartz.dart';
import 'package:firebase_learn/core/error/faliures.dart';
import 'package:firebase_learn/core/usecases/usecase.dart';
import 'package:firebase_learn/features/Auth/data/models/profile_response_model.dart';
import 'package:firebase_learn/features/Auth/domain/repositories/auth_repository.dart';

class ProfileUsecase implements UseCase<ProfileResponseModel, NoParams> {
  final AuthRepository repository;

  ProfileUsecase({required this.repository});

  @override
  Future<Either<Failure, ProfileResponseModel>> call(NoParams params) async {
    return await repository.getProfile();
  }
}
