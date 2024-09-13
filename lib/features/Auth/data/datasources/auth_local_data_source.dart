import 'dart:developer';
import 'package:firebase_learn/core/constant/string.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class SplashLocalDataSource {
  Future<bool> isLoggedIn();
}

class AuthLocalDataSource implements SplashLocalDataSource {
  final FlutterSecureStorage sharedPref;

  AuthLocalDataSource({required this.sharedPref});

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
}
