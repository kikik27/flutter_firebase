import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_learn/core/helpers/logger.dart';
import 'package:firebase_learn/core/usecases/usecase.dart';
import 'package:firebase_learn/features/Auth/data/models/profile_response_model.dart';
import 'package:firebase_learn/features/Auth/domain/usecases/is_logged_in.dart';
import 'package:firebase_learn/features/Auth/domain/usecases/login_usecase.dart';
import 'package:firebase_learn/features/Auth/domain/usecases/profile_usecase.dart';
import 'package:google_sign_in/google_sign_in.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final FirebaseAuth firebaseAuth;
  final LoginUsecase loginUsecase;
  final IsLoggedIn isLoggedIn;
  final ProfileUsecase profileUsecase;

  AuthBloc(
      {required this.firebaseAuth,
      required this.loginUsecase,
      required this.isLoggedIn,
      required this.profileUsecase})
      : super(AuthInitial()) {
    on<AuthSignIn>((event, emit) => _onSubmitedLogin(event, emit));
    on<AuthSignInGoogle>((event, emit) => _onSubmitedGoogleLogin(event, emit));
    on<CheckLoggedInEvent>((event, emit) => _onCheckLoggedIn(event, emit));
    on<AuthSignOut>((event, emit) => _onSignOut(event, emit));
  }

  /// Handles [AuthSignIn] events.
  ///
  /// Signs in with the given credentials, and if successful, checks if the user
  /// has a corresponding document in the 'users' collection. If the document
  /// exists, it emits an [Authenticated] state with the user and the user data.
  /// If the document does not exist, it emits an [AuthError] state with a
  /// message. If there is an error signing in, it emits an [AuthError] state
  /// with the error message. Finally, it emits a [Loading] state with
  /// [isloading] set to false.
  // Future<void> _onSubmitedLogin(
  //   AuthSignIn event,
  //   Emitter<AuthState> emit,
  // ) async {
  //   emit(const Loading(isloading: true));

  //   try {
  //     final response = await _firebaseAuth.signInWithEmailAndPassword(
  //       email: event.email,
  //       password: event.password,
  //     );

  //     emit(Authenticated(user: response.user!));
  //   } on FirebaseAuthException catch (e) {
  //     logger.e(e.code);
  //     emit(AuthError(message: e.message ?? 'An unknown error occurred.'));
  //   }

  //   emit(const Loading(isloading: false));
  // }

  Future<void> _onSubmitedLogin(
    AuthSignIn event,
    Emitter<AuthState> emit,
  ) async {
    emit(const Loading(isloading: true));

    try {
      final response = await loginUsecase
          .call(LoginParams(username: event.email, password: event.password));
      emit(response
          .fold((failure) => AuthError(message: failure.message.toString()),
              (success) {
        return const Authenticated(isAuth: true, user: null);
      }));
    } catch (e) {
      emit(AuthError(message: e.toString()));
    }

    emit(const Loading(isloading: false));
  }

  Future<void> _onCheckLoggedIn(
      CheckLoggedInEvent event, Emitter<AuthState> emit) async {
    emit(const Loading(isloading: true));

    try {
      final response = await isLoggedIn.call(NoParams());

      if (response.isLeft()) {
        final failure = response.fold((l) => l, (r) => null);
        emit(
            AuthError(message: failure?.message.toString() ?? 'Unknown error'));
      } else {
        final profile = await profileUsecase.call(NoParams());
        if (profile.isRight()) {
          emit(const Authenticated(
              isAuth: true, user: null)); // Gunakan profile jika diperlukan
        }
      }
    } catch (e) {
      emit(const AuthError(message: 'An unknown error occurred.'));
    }
  }

  _onSignOut(AuthSignOut event, Emitter<AuthState> emit) {
    emit(const Loading(isloading: true));
    try {
      firebaseAuth.signOut();
    } catch (e) {
      emit(const AuthError(message: 'An unknown error occurred.'));
    }
  }

  Future<void> _onSubmitedGoogleLogin(
      AuthSignInGoogle event, Emitter<AuthState> emit) async {
    // emit(const Loading(isloading: true));
    try {
      logger.i("Masuk");
      const List<String> scopes = <String>[
        'email',
        'https://www.googleapis.com/auth/contacts.readonly',
      ];

      GoogleSignIn googleSignIn = GoogleSignIn(
        scopes: scopes,
      );

      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      final response =
          await FirebaseAuth.instance.signInWithCredential(credential);

      emit(Authenticated(user: response.user!, isAuth: null));
    } on FirebaseAuthException catch (e) {
      logger.e(e.code);
      emit(AuthError(message: e.message ?? 'An unknown error occurred.'));
    } catch (e) {
      logger.e(e);
      emit(const AuthError(message: 'An unknown error occurred.'));
    }
    // emit(const Loading(isloading: false));
  }
}
