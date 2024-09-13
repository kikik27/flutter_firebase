import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_learn/container_injection.dart';
import 'package:firebase_learn/core/helpers/logger.dart';
import 'package:firebase_learn/features/Auth/presentation/bloc/auth_bloc.dart';
// import 'package:firebase_learn/container_injection.dart';
// import 'package:firebase_learn/core/helpers/logger.dart';
// import 'package:firebase_learn/features/Auth/presentation/bloc/auth_bloc.dart';
import 'package:firebase_learn/features/Auth/presentation/pages/login_page.dart';
import 'package:firebase_learn/features/Auth/presentation/pages/register_page.dart';
import 'package:firebase_learn/features/Home/presentation/pages/home_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomeRoute.page, initial: true),
        AutoRoute(page: LoginRoute.page),
        AutoRoute(
          page: RegisterRoute.page,
        )
      ];
}

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    sl<AuthBloc>().add(const CheckLoggedInEvent());
    final state = sl<AuthBloc>().state;

    if (state is Authenticated) {
      logger.i(FirebaseAuth.instance.currentUser);
      resolver.next(true);
    }

    router.navigate(const LoginRoute());
    // FirebaseAuth.instance.authStateChanges().listen((User? user) {
    //   if (user != null) {
    //   } else {
    //     router.navigate(const LoginRoute());
    //   }
    // });
  }
}
