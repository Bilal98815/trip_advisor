part of 'data.dart';

class SignUpWithEmailAndPasswordFailure implements Exception {
  SignUpWithEmailAndPasswordFailure([String? message])
      : message = message ?? LocaleStrings.signupExceptionSomethingWrong;

  factory SignUpWithEmailAndPasswordFailure.fromCode(String code) {
    switch (code) {
      case 'invalid-email':
        return SignUpWithEmailAndPasswordFailure(
          LocaleStrings.signupExceptionInvalidEmail,
        );
      case 'user-disabled':
        return SignUpWithEmailAndPasswordFailure(
          LocaleStrings.signupExceptionDisabledUser,
        );
      case 'email-already-in-use':
        return SignUpWithEmailAndPasswordFailure(
          LocaleStrings.signupExceptionAccountExists,
        );
      case 'operation-not-allowed':
        return SignUpWithEmailAndPasswordFailure(
          LocaleStrings.signupExceptionOperationNotAllowed,
        );
      case 'weak-password':
        return SignUpWithEmailAndPasswordFailure(
          LocaleStrings.signupExceptionWeakPassword,
        );
      default:
        return SignUpWithEmailAndPasswordFailure();
    }
  }

  final String message;
}
