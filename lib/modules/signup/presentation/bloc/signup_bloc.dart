import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trip_advisor/common/helpers/helpers.dart';
import 'package:trip_advisor/modules/signup/signup.dart';

part 'signup_bloc_state.dart';
part 'signup_event.dart';

class SignupBloc extends Bloc<SignupEvent, SignupBlocState> {
  SignupBloc({
    required this.signUpRepository,
  }) : super(const SignupBlocState()) {
    on<RegisterEvent>((event, emit) async {
      await register(event.email, event.password, emit);
    });

    on<CheckBoxEvent>((event, emit) {
      updateCheckbox(emit);
    });
  }
  late SignUpRepository signUpRepository;

  Future<void> register(
    String email,
    String password,
    Emitter<SignupBlocState> emit,
  ) async {
    emit(state.copyWith(registerApiState: ApiState.loading));
    try {
      await signUpRepository.registerUser(email, password);
      emit(state.copyWith(registerApiState: ApiState.done));
    } on FirebaseException catch (e) {
      debugPrint('----->>> $e');
      updateError(e.code);
    } catch (e) {
      debugPrint('----->>> $e');
      updateError(e.toString());
    }
  }

  void updateCheckbox(Emitter<SignupBlocState> emit) {
    emit(state.copyWith(isChecked: !state.isChecked));
  }

  void updateError(String exception) {
    String error = '';
    switch (exception) {
      case 'Something went wrong':
        error = 'Something went wrong';
      case 'Enter correct credentials':
        error = 'Enter correct credentials';
      case '[firebase_auth/invalid-email] The email address is badly formatted':
        error = 'Invalid email format';
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
        registerApiState: ApiState.error,
      ),
    );
  }
}
