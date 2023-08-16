part of 'login_bloc.dart';

class LoginBlocState extends Equatable {
  const LoginBlocState({
    this.errorMessage = '',
    this.authApiState = ApiState.idle,
  });
  @override
  List<Object?> get props => [authApiState, errorMessage];

  final String errorMessage;
  final ApiState authApiState;

  LoginBlocState copyWith({
    String? errorMessage,
    ApiState? authApiState,
  }) {
    return LoginBlocState(
      errorMessage: errorMessage ?? this.errorMessage,
      authApiState: authApiState ?? this.authApiState,
    );
  }
}
