import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:localization/localization.dart';

import 'package:trip_advisor/common/common.dart';
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

    on<LoginErrorUpdated>((event, emit) {
      updateError(event.error, emit);
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
    } on LogInWithEmailAndPasswordFailure catch (e) {
      emit(
        state.copyWith(
          authApiState: ApiState.error,
          errorMessage: e.message,
        ),
      );
    } catch (_) {
      emit(
        state.copyWith(
          authApiState: ApiState.error,
          errorMessage: LocaleStrings.loginExceptionSomethingWrong,
        ),
      );
    }
  }

  void updateError(
    String error,
    Emitter<LoginBlocState> emit,
  ) {
    emit(
      state.copyWith(
        errorMessage: error,
        authApiState: ApiState.error,
      ),
    );
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
}
