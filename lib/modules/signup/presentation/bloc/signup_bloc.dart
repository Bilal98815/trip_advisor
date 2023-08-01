import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trip_advisor/modules/signup/presentation/bloc/signup_bloc_state.dart';
import 'package:trip_advisor/modules/signup/presentation/bloc/signup_event.dart';

import '../../../../common/helpers/enums/enums.dart';
import '../../domain/repository/signup_repository.dart';

class SignupBloc extends Bloc<SignupEvent, SignupBlocState> {
  late SignUpRepository signUpRepository;

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

  Future register(String email, String password, Emitter emit) async {
    emit(state.copyWith(registerApiState: ApiState.loading));
    try {
      await signUpRepository.registerUser(email, password);
      emit(state.copyWith(registerApiState: ApiState.done));
    } on FirebaseException catch (e) {
      debugPrint('----->>> ${e.toString()}');
      updateError(e.code);
    } catch (e) {
      debugPrint('----->>> ${e.toString()}');
      updateError(e.toString());
    }
  }

  void updateCheckbox(Emitter emit) {
    emit(state.copyWith(isChecked: !state.isChecked));
  }

  void updateError(String exception) {
    String error = '';
    switch (exception) {
      case 'Something went wrong':
        error = 'Something went wrong';
        break;
      case 'Enter correct credentials':
        error = 'Enter correct credentials';
        break;
      case '[firebase_auth/invalid-email] The email address is badly formatted':
        error = 'Invalid email format';
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
    emit(
      state.copyWith(
        errorMessage: error,
        registerApiState: ApiState.error,
      ),
    );
  }
}
