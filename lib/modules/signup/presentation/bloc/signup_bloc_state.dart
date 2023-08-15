part of 'signup_bloc.dart';

class SignupBlocState extends Equatable {
  const SignupBlocState({
    this.errorMessage = '',
    this.isChecked = true,
    this.registerApiState = ApiState.idle,
  });
  @override
  List<Object?> get props => [errorMessage, registerApiState, isChecked];

  final String errorMessage;
  final ApiState registerApiState;
  final bool isChecked;

  SignupBlocState copyWith({
    String? errorMessage,
    ApiState? registerApiState,
    bool? isChecked,
  }) {
    return SignupBlocState(
      errorMessage: errorMessage ?? this.errorMessage,
      isChecked: isChecked ?? this.isChecked,
      registerApiState: registerApiState ?? this.registerApiState,
    );
  }
}
