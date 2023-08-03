import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import '../../../../common/helpers/enums/enums.dart';
import '../../../../common/helpers/shared_preferences/shared_preferences.dart';
import '../../domain/repository/login_repository.dart';
import 'login_bloc_state.dart';
import 'login_event.dart';

class LoginBloc extends Bloc<LoginEvent, LoginBlocState> {
  late LoginRepository loginRepository;

  LoginBloc({required this.loginRepository}) : super(const LoginBlocState()) {
    on<OnLoginEvent>((event, emit) async {
      await login(event.email, event.password, emit);
    });

    on<GetUserDetailsFromDb>((event, emit) async {
      await getUserDetailsFromDb(event.email);
    });

    // on<GetUserFromPreferencesEvent>((event, emit) async {
    //   return getUserFromPreferences();
    // });
  }

  final prefs = Preferences();

  Future login(String email, String password, Emitter emit) async {
    emit(state.copyWith(authApiState: ApiState.loading));
    //String? token = await authService.getFCMToken();
    try {
      await loginRepository.signInUser(email, password);
      String? token = await prefs.getFCMToken();
      await loginRepository.updateUser(token!, email);
      //await authService.updateUser(token!, email, 'online');
      emit(state.copyWith(authApiState: ApiState.done));
      //emailId = email;
    } on FirebaseException catch (e) {
      debugPrint('----->>> ${e.toString()}');
      updateError(e.code);
    } catch (e) {
      updateError(e.toString());
    }
  }

  Future getUserDetailsFromDb(String email) async {
    await loginRepository.getUserDetails(email);
  }

  Future getUserFromPreferences() async {
    final user = await prefs.getSharedPreferenceUser();
    return user;
  }

  void setEmailInPreferences(String email) {
    prefs.setEmail(email);
  }

  void updateError(String exception) {
    String error = '';
    switch (exception) {
      case 'Something went wrong':
        error = 'Something went wrong';
        break;
      case '[firebase_auth/network-request-failed] A network error (such as timeout, interrupted connection or unreachable host) has occurred':
        error = 'Network Error!';
        break;
      case '[firebase_auth/unknown] Given String is empty or null':
        error = 'Enter correct credentials';
        break;
      case 'Enter correct credentials':
        error = 'Enter correct credentials';
        break;
      case 'invalid-email':
        error = 'Invalid email format';
        break;
      case 'wrong-password':
        error = 'Invalid Password';
        break;
      case 'user-not-found':
        error = 'User not found';
        break;
      case 'user-disabled':
        error = 'User account disabled';
        break;
      case 'email-already-in-use':
        error = 'Email is already in use';
        break;
      case 'weak-password':
        error = 'Weak Password';
        break;
    }
    emit(state.copyWith(
      errorMessage: error,
      authApiState: ApiState.error,
    ));
  }
}
