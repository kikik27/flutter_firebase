// coverage:ignore-file
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:firebase_learn/core/helpers/api/api.dart';

class ApiService {
  static ApiService? _instance;

  Api api = Api();

  factory ApiService() => _instance ?? ApiService._();

  ApiService._();

  Future<Response<T>> get<T>(
    String url, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    return await api.dio
        .get<T>(url, queryParameters: queryParameters, data: data);
  }

  Future<Response<T>> post<T>(String url,
      {dynamic data,
      Map<String, dynamic>? queryParameters,
      Options? options}) async {
    return await api.dio.post(url,
        data: data, queryParameters: queryParameters, options: options);
  }

  Future<Response<T>> put<T>(String url,
      {dynamic data,
      Map<String, dynamic>? queryParameters,
      Options? options}) async {
    return await api.dio.put(url,
        data: data, queryParameters: queryParameters, options: options);
  }

  void useAccessToken(String? token) {
    if (token != null && token.isNotEmpty) {
      api.dio.options.headers[HttpHeaders.authorizationHeader] =
          "Bearer $token";
      api.dio.options.headers["device"] = "mobile";
      api.dio.options.headers[HttpHeaders.contentTypeHeader] =
          "application/json";
    } else {
      api.dio.options.headers.remove(HttpHeaders.authorizationHeader);
    }
  }
}
