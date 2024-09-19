import 'dart:developer';
import 'package:firebase_learn/core/constant/string.dart';
import 'package:firebase_learn/core/helpers/logger.dart';
import 'package:firebase_learn/features/Auth/data/models/profile_response_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class AuthLocalDataSource {
  Future<bool> isLoggedIn();
  Future<String> getToken();
  Future<bool> setToken(String token);
  Future<String> getProfile();
  Future<bool> setProfile(ProfileResponseModel profile);
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final FlutterSecureStorage sharedPref;

  AuthLocalDataSourceImpl({required this.sharedPref});

  @override
  Future<bool> isLoggedIn() async {
    try {
      var token = await sharedPref.read(key: SharedPrefKeys.tokenKey);
      log("token");
      var result = token != null;
      return result;
    } catch (err) {
      throw Exception(err.toString());
    }
  }

  @override
  Future<String> getToken() async {
    try {
      final data = await sharedPref.read(key: SharedPrefKeys.tokenKey);
      if (data != null) {
        logger.d(data);
        return data;
      } else {
        throw Exception();
      }
    } catch (err) {
      throw Exception(err.toString());
    }
  }

  @override
  Future<bool> setToken(String token) async {
    try {
      await sharedPref.write(key: SharedPrefKeys.tokenKey, value: token).then(
          (value) =>
              sharedPref.write(key: SharedPrefKeys.loggedInKey, value: "true"));
      logger.d(token);
      return Future.value(true);
    } catch (err) {
      throw Exception(err.toString());
    }
  }

  @override
  Future<String> getProfile() async {
    try {
      final data = await sharedPref.read(key: SharedPrefKeys.profileKey);
      if (data != null) {
        return data;
      } else {
        throw Exception();
      }
    } catch (err) {
      throw Exception(err.toString());
    }
  }

  @override
  Future<bool> setProfile(ProfileResponseModel data) async {
    try {
      await sharedPref.write(key: SharedPrefKeys.profileKey, value: "true");

      return Future.value(true);
    } catch (err) {
      throw Exception(err.toString());
    }
  }
}
