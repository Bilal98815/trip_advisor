import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:trip_advisor/common/helpers/enums/enums.dart';
import 'package:trip_advisor/modules/forgot_password/domain/repository/forgot_password_repository.dart';
import 'package:trip_advisor/modules/forgot_password/presentation/bloc/forgot_password_bloc_state.dart';
import 'package:trip_advisor/modules/forgot_password/presentation/bloc/forgot_password_event.dart';

class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  ForgotPasswordBloc({required this.forgotPasswordRepository})
      : super(const ForgotPasswordState()) {
    on<ResetPassword>((event, emit) async {
      await resetPassword(event.email, emit);
    });
    on<ShowError>((event, emit) {
      showError(event.error, emit);
    });
  }
  late ForgotPasswordRepository forgotPasswordRepository;

  Future<void> resetPassword(
    String email,
    Emitter<ForgotPasswordState> emit,
  ) async {
    try {
      await forgotPasswordRepository.sendResetPasswordEmail(email);
      emit(state.copyWith(resetPasswordState: ResetPasswordState.success));
    } on FirebaseAuthException catch (e) {
      showError(e.code, emit);
    }
  }

  void showError(String exception, Emitter<ForgotPasswordState> emit) {
    String temp = '';
    switch (exception) {
      case 'user-not-found':
        temp = 'User not found';
      case 'invalid-email':
        temp = 'Invalid Email';
      case 'too-many-requests':
        temp = 'Please try again later';
      case 'requires-recent-login':
        temp = 'Login again';
    }
    emit(
      state.copyWith(
        error: temp,
        resetPasswordState: ResetPasswordState.failure,
      ),
    );
  }
}
