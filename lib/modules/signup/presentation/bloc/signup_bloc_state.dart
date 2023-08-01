import 'package:equatable/equatable.dart';

import '../../../../common/helpers/enums/enums.dart';

class SignupBlocState extends Equatable {
  @override
  List<Object?> get props => [errorMessage, registerApiState, isChecked];

  final String errorMessage;
  final ApiState registerApiState;
  final bool isChecked;

  const SignupBlocState({
    this.errorMessage = '',
    this.isChecked = true,
    this.registerApiState = ApiState.idle,
  });

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
