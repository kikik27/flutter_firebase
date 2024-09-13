import 'package:firebase_learn/core/routes/app_router.dart';
import 'package:get_it/get_it.dart';

final GetIt slRouter = GetIt.asNewInstance();

void setupRouterDependencies() {
  slRouter.registerLazySingleton<AppRouter>(() => AppRouter());
}
