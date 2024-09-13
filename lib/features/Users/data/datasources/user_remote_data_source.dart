import 'package:firebase_learn/core/constant/string.dart';
import 'package:firebase_learn/core/error/exceptions.dart';
import 'package:firebase_learn/core/helpers/api/api_service.dart';
import 'package:firebase_learn/features/Users/domain/entities/user_entity.dart';

abstract class UserRemoteDataSource {
  Future<List<UserEntity>> getUserRemoteData();
}

class UserRemoteDataImpl implements UserRemoteDataSource {
  final ApiService dio;

  UserRemoteDataImpl({required this.dio});

  @override
  Future<List<UserEntity>> getUserRemoteData() async {
    try {
      final response = await dio.get(ApiEndPoints.buildingLocationApiUrl);
      if (response.statusCode == 200) {
        final res = response.data["data"];
        return res;
      } else {
        return [];
      }
    } catch (err) {
      throw ServerException(message: err.toString());
    }
  }
}
