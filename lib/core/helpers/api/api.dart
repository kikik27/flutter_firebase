// coverage:ignore-file
import 'package:dio/dio.dart';
import 'package:firebase_learn/container_injection.dart';
import 'package:firebase_learn/core/helpers/api/api_interceptor.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class Api {
  final FlutterSecureStorage storage = sl();
  Dio? _dio;

  Dio get dio {
    if (_dio != null) {
      return _dio!;
    } else {
      var dio = Dio(
        BaseOptions(
            headers: {"Accept": "application/json", "device": "mobile"},
            baseUrl: dotenv.env['BASE_API_URL'].toString(),
            receiveTimeout: const Duration(seconds: 45),
            connectTimeout: const Duration(seconds: 250),
            sendTimeout: const Duration(seconds: 45)),
      );
      dio.interceptors.addAll({ApiInterceptors(dio, storage)});
      dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        compact: false,
      ));
      // dio.interceptors.add(sl<Chuck>().getDioInterceptor());
      return dio;
    }
  }

  Api._internal();

  static final _singleton = Api._internal();

  factory Api() => _singleton;
}
