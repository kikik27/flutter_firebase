import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_learn/core/helpers/logger.dart';
import 'package:google_sign_in/google_sign_in.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final FirebaseAuth _firebaseAuth;

  AuthBloc(this._firebaseAuth) : super(AuthInitial()) {
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
  Future<void> _onSubmitedLogin(
    AuthSignIn event,
    Emitter<AuthState> emit,
  ) async {
    emit(const Loading(isloading: true));

    try {
      final response = await _firebaseAuth.signInWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );

      emit(Authenticated(user: response.user!));
    } on FirebaseAuthException catch (e) {
      logger.e(e.code);
      emit(AuthError(message: e.message ?? 'An unknown error occurred.'));
    }

    emit(const Loading(isloading: false));
  }

  Future<void> _onCheckLoggedIn(
      CheckLoggedInEvent event, Emitter<AuthState> emit) async {
    emit(const Loading(isloading: true));

    try {
      logger.i(_firebaseAuth.currentUser!);

      emit(Authenticated(user: _firebaseAuth.currentUser!));
    } catch (e) {
      emit(const AuthError(message: 'An unknown error occurred.'));
    }
  }

  _onSignOut(AuthSignOut event, Emitter<AuthState> emit) {
    emit(const Loading(isloading: true));
    try {
      _firebaseAuth.signOut();
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

      emit(Authenticated(user: response.user!));
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
