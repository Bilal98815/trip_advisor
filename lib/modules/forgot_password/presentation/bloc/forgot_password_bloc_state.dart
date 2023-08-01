import 'package:equatable/equatable.dart';

import '../../../../common/helpers/enums/enums.dart';

class ForgotPasswordState extends Equatable {
  @override
  List<Object?> get props => [error, resetPasswordState];

  final String error;
  final ResetPasswordState resetPasswordState;

  const ForgotPasswordState(
      {this.error = '', this.resetPasswordState = ResetPasswordState.idle});

  ForgotPasswordState copyWith(
      {String? error, ResetPasswordState? resetPasswordState}) {
    return ForgotPasswordState(
        error: error ?? this.error,
        resetPasswordState: resetPasswordState ?? this.resetPasswordState);
  }
}
