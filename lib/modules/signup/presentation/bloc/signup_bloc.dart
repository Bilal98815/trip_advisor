import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localization/localization.dart';
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

    on<SignupErrorUpdated>((event, emit) {
      updateError(event.error, emit);
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
    } on SignUpWithEmailAndPasswordFailure catch (e) {
      emit(
        state.copyWith(
          errorMessage: e.message,
          registerApiState: ApiState.error,
        ),
      );
    } catch (_) {
      emit(
        state.copyWith(
          errorMessage: LocaleStrings.signupExceptionSomethingWrong,
          registerApiState: ApiState.error,
        ),
      );
    }
  }

  void updateCheckbox(Emitter<SignupBlocState> emit) {
    emit(state.copyWith(isChecked: !state.isChecked));
  }

  void updateError(String error, Emitter<SignupBlocState> emit) {
    emit(
      state.copyWith(
        errorMessage: error,
        registerApiState: ApiState.error,
      ),
    );
  }
}
