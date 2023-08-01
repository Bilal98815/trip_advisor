import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:trip_advisor/modules/forgot_password/presentation/bloc/forgot_password_bloc_state.dart';
import 'package:trip_advisor/modules/forgot_password/presentation/bloc/forgot_password_event.dart';

import '../../../../common/helpers/enums/enums.dart';
import '../../domain/repository/forgot_password_repository.dart';

class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  late ForgotPasswordRepository forgotPasswordRepository;

  ForgotPasswordBloc({required this.forgotPasswordRepository})
      : super(const ForgotPasswordState()) {
    on<ResetPassword>((event, emit) async {
      await resetPassword(event.email, emit);
    });
    on<ShowError>((event, emit) {
      showError(event.error, emit);
    });
  }

  Future resetPassword(String email, Emitter emit) async {
    try {
      await forgotPasswordRepository.sendResetPasswordEmail(email);
      emit(state.copyWith(resetPasswordState: ResetPasswordState.success));
    } on FirebaseAuthException catch (e) {
      showError(e.code, emit);
    }
  }

  void showError(String exception, Emitter emit) {
    String temp = '';
    switch (exception) {
      case 'user-not-found':
        temp = 'User not found';
        break;
      case 'invalid-email':
        temp = "Invalid Email";
        break;
      case 'too-many-requests':
        temp = "Please try again later";
        break;
      case 'requires-recent-login':
        temp = "Login again";
        break;
    }
    emit(state.copyWith(
        error: temp, resetPasswordState: ResetPasswordState.failure));
  }
}
