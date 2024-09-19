import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_learn/core/helpers/api/api_service.dart';
import 'package:firebase_learn/features/Auth/data/datasources/auth_local_data_source.dart';
import 'package:firebase_learn/features/Auth/data/datasources/auth_remote_data_source.dart';
import 'package:firebase_learn/features/Auth/data/repositories/auth_repository_impl.dart';
import 'package:firebase_learn/features/Auth/domain/repositories/auth_repository.dart';
import 'package:firebase_learn/features/Auth/domain/usecases/is_logged_in.dart';
import 'package:firebase_learn/features/Auth/domain/usecases/login_usecase.dart';
import 'package:firebase_learn/features/Auth/domain/usecases/profile_usecase.dart';
import 'package:firebase_learn/features/Auth/presentation/bloc/auth_bloc.dart';
import 'package:firebase_learn/features/Users/data/repositories/user_repository_impl.dart';
import 'package:firebase_learn/features/Users/domain/usecases/get_user.dart';
import 'package:firebase_learn/features/Users/presentation/bloc/users_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

init() async {
  sl.registerFactory(() => AuthBloc(
      firebaseAuth: FirebaseAuth.instance,
      loginUsecase: sl<LoginUsecase>(),
      isLoggedIn: sl<IsLoggedIn>(),
      profileUsecase: sl<ProfileUsecase>()
      ));
      
  sl.registerFactory(() => UsersBloc(sl<GetUsers>()));

//usecase
  sl.registerLazySingleton(() => IsLoggedIn(repository: sl<AuthRepository>()));
  sl.registerLazySingleton(() => GetUsers(sl()));
  sl.registerLazySingleton(
      () => LoginUsecase(repository: sl<AuthRepository>()));
  sl.registerLazySingleton(
      () => ProfileUsecase(repository: sl<AuthRepository>()));

//repository
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(
      authLocalDataSource: sl<AuthLocalDataSource>(),
      authRemoteDataSource: sl<AuthRemoteDataSource>()));
  sl.registerLazySingleton(() => UserRepositoryImpl());

  //data source
  sl.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(dio: sl(), authLocalDataSource: sl()));

  sl.registerLazySingleton<AuthLocalDataSource>(
      () => AuthLocalDataSourceImpl(sharedPref: sl()));
//extrnal
  sl.registerSingleton(const FlutterSecureStorage());
  sl.registerSingleton(() => Dio());
  sl.registerSingleton(ApiService());
}
