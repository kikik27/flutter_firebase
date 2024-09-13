import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_learn/core/helpers/api/api_service.dart';
import 'package:firebase_learn/features/Auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

init() async {
  sl.registerSingleton(const FlutterSecureStorage());
  sl.registerSingleton(() => Dio());
  sl.registerSingleton(ApiService());

  sl.registerFactory(
      () => AuthBloc(FirebaseAuth.instance));
}
