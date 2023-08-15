import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:trip_advisor/common/helpers/enums/enums.dart';
import 'package:trip_advisor/common/helpers/shared_preferences/shared_preferences.dart';
import 'package:trip_advisor/common/models/user_model.dart';
import 'package:trip_advisor/modules/login/login.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginBlocState> {
  LoginBloc({required this.loginRepository}) : super(const LoginBlocState()) {
    on<OnLoginEvent>((event, emit) async {
      await login(event.email, event.password, emit);
    });

    on<GetUserDetailsFromDb>((event, emit) async {
      await getUserDetailsFromDb(event.email);
    });
  }
  late LoginRepository loginRepository;

  final prefs = Preferences();

  Future<void> login(
    String email,
    String password,
    Emitter<LoginBlocState> emit,
  ) async {
    emit(state.copyWith(authApiState: ApiState.loading));

    try {
      await loginRepository.signInUser(email, password);
      final String? token = await prefs.getFCMToken();
      await loginRepository.updateUser(token!, email);

      emit(state.copyWith(authApiState: ApiState.done));
    } on FirebaseException catch (e) {
      debugPrint('----->>> $e');
      updateError(e.code);
    } catch (e) {
      updateError(e.toString());
    }
  }

  Future<void> getUserDetailsFromDb(String email) async {
    await loginRepository.getUserDetails(email);
  }

  Future<UserModel> getUserFromPreferences() async {
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
      case '[firebase_auth/network-request-failed] A network error (such as timeout, interrupted connection or unreachable host) has occurred':
        error = 'Network Error!';
      case '[firebase_auth/unknown] Given String is empty or null':
        error = 'Enter correct credentials';
      case 'Enter correct credentials':
        error = 'Enter correct credentials';
      case 'invalid-email':
        error = 'Invalid email format';
      case 'wrong-password':
        error = 'Invalid Password';
      case 'user-not-found':
        error = 'User not found';
      case 'user-disabled':
        error = 'User account disabled';
      case 'email-already-in-use':
        error = 'Email is already in use';
      case 'weak-password':
        error = 'Weak Password';
    }
    emit(
      state.copyWith(
        errorMessage: error,
        authApiState: ApiState.error,
      ),
    );
  }
}
