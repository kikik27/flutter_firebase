import 'package:firebase_learn/core/constant/string.dart';
import 'package:firebase_learn/core/helpers/api/api_service.dart';
import 'package:firebase_learn/core/helpers/logger.dart';
import 'package:firebase_learn/features/Auth/data/datasources/auth_local_data_source.dart';
import 'package:firebase_learn/features/Auth/data/models/login_response_model.dart';
import 'package:firebase_learn/features/Auth/data/models/profile_response_model.dart';

abstract class AuthRemoteDataSource {
  Future<LoginResponseModel> login(Map<String, dynamic> data);
  Future<ProfileResponseModel> getProfile();
}

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  final ApiService dio;
  final AuthLocalDataSource authLocalDataSource;

  AuthRemoteDataSourceImpl(
      {required this.dio, required this.authLocalDataSource});

  @override
  Future<LoginResponseModel> login(Map<String, dynamic> data) async {
    try {
      final response = await dio.post(ApiEndPoints.loginApiUrl, data: data);
      if (response.statusCode == 200) {
        logger.d(response.data);
        authLocalDataSource.setToken(response.data['token']);
        return LoginResponseModel.fromJson(response.data);
      } else {
        throw Exception();
      }
    } catch (e) {
      rethrow;
    }
  }

  /// Gets the current user's profile information
  ///
  /// Throws a [Exception] if the request fails
  ///
  /// Returns a [ProfileResponseModel] containing the user's profile information
  ///
  @override
  Future<ProfileResponseModel> getProfile() async {
    try {
      final response = await dio.get(ApiEndPoints.profileApiUrl);
      if (response.statusCode == 200) {
        logger.d(response.data);
        return ProfileResponseModel.fromJson(response.data);
      } else {
        throw Exception();
      }
    } catch (e) {
      rethrow;
    }
  }
}
