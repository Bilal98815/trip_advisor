import 'package:equatable/equatable.dart';

import 'package:trip_advisor/common/helpers/enums/enums.dart';

class ForgotPasswordState extends Equatable {

  const ForgotPasswordState(
      {this.error = '', this.resetPasswordState = ResetPasswordState.idle,});
  @override
  List<Object?> get props => [error, resetPasswordState];

  final String error;
  final ResetPasswordState resetPasswordState;

  ForgotPasswordState copyWith(
      {String? error, ResetPasswordState? resetPasswordState,}) {
    return ForgotPasswordState(
        error: error ?? this.error,
        resetPasswordState: resetPasswordState ?? this.resetPasswordState,);
  }
}
