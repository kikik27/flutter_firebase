// coverage:ignore-file

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:firebase_learn/core/constant/string.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ApiInterceptors extends Interceptor {
  final Dio dio;
  final FlutterSecureStorage storage;

  ApiInterceptors(
    this.dio,
    this.storage,
  );

  @override

  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers["Content-Type"] =
        (options.data is FormData) ? "multipart/form-data" : "application/json";

    // options.followRedirects = false;
    options.validateStatus = (status) => true;

    var accessToken = await storage.read(key: SharedPrefKeys.tokenKey);
  /// The [RequestInterceptorHandler.next] method is called with the modified
  /// [RequestOptions] object after the headers have been added.
    if (options.uri.path.contains("validate-otp")) {
      accessToken = await storage.read(key: SharedPrefKeys.tokenKey);
    }

    if (accessToken != null) {
      options.headers[HttpHeaders.authorizationHeader] = "Bearer $accessToken";
      options.headers["device"] = "mobile";
    }

    return handler.next(options);
  }

  // @override
  // void onError(DioException err, ErrorInterceptorHandler handler) {
  //   switch (err.type) {
  //     case DioExceptionType.connectionTimeout:
  //       throw ServerException(
  //           message:
  //               'Terjadi Kesalahan, Periksa konesi internet Anda, Mohon Coba Lagi');
  //     case DioExceptionType.sendTimeout:
  //       throw ServerException(
  //           message:
  //               'Terjadi Kesalahan, Periksa konesi internet Anda, Mohon Coba Lagi');
  //     case DioExceptionType.receiveTimeout:
  //       throw ServerException(
  //           message:
  //               'Terjadi Kesalahan, Periksa konesi internet Anda, Mohon Coba Lagi');
  //     case DioExceptionType.connectionError:
  //       throw ServerException(message: err.response?.data["data"]['message']);
  //     case DioExceptionType.badResponse:
  //       switch (err.response?.statusCode) {
  //         case 403:
  //         case 401:
  //           storage.delete(key: SharedPrefKeys.loggedInKey);
  //           storage.delete(key: SharedPrefKeys.tokenKey);
  //       }
  //       throw ServerException(
  //           message: err.response?.data["data"]['message'] +
  //               err.response?.statusCode);
  //     case DioExceptionType.cancel:
  //       throw ServerException(message: 'Cancel');
  //     case DioExceptionType.badCertificate:
  //       throw ServerException(message: 'Bad Certificate');
  //     case DioExceptionType.unknown:
  //       throw ServerException(
  //           message: err.response.toString());
  //     default:
  //      throw ServerException(message: err.response.toString());
  //   }
  // }
}
