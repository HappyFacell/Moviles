import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../user_auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final ReporsitoryAuth _userAuthRepository = ReporsitoryAuth();
  AuthBloc() : super(AuthInitial()) {
    on<VerifyAuthEvent>(_authVerification);
    on<SignOutEvent>(_signOut);
    on<GoogleAuthEvent>(_authUser);
  }

  FutureOr<void> _authVerification(event, emit) {
    //initialize data from app
    if (_userAuthRepository.isAlreadyAuthenticated()) {
      emit(AuthSuccessState());
    } else {
      emit(UnAuthState());
    }
  }

  FutureOr<void> _signOut(event, emit) async {
    await _userAuthRepository.signOutFirebaseUser();
    await _userAuthRepository.signOutGoogleUser();
    emit(SignOutSuccessState());
  }

  FutureOr<void> _authUser(event, emit) async {
    try {
      await _userAuthRepository.signInWithGoogle();
      emit(AuthSuccessState());
    } catch (e) {
      emit(AuthErrorState());
    }
  }
}
