import 'package:equatable/equatable.dart';

import '../../../../common/helpers/enums/enums.dart';

class LoginBlocState extends Equatable {
  @override
  List<Object?> get props => [authApiState, errorMessage];

  final String errorMessage;
  final ApiState authApiState;

  const LoginBlocState({
    this.errorMessage = '',
    this.authApiState = ApiState.idle,
  });

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
