part of 'data.dart';

class LogInWithEmailAndPasswordFailure implements Exception {
  LogInWithEmailAndPasswordFailure([String? message])
      : message = message ?? LocaleStrings.loginExceptionSomethingWrong;

  factory LogInWithEmailAndPasswordFailure.fromCode(String code) {
    switch (code) {
      case 'invalid-email':
        return LogInWithEmailAndPasswordFailure(
          LocaleStrings.loginExceptionInvalidEmail,
        );
      case 'user-disabled':
        return LogInWithEmailAndPasswordFailure(
          LocaleStrings.loginExceptionDisabledUser,
        );
      case 'user-not-found':
        return LogInWithEmailAndPasswordFailure(
          LocaleStrings.loginExceptionNoUser,
        );
      case 'wrong-password':
        return LogInWithEmailAndPasswordFailure(
          LocaleStrings.loginExceptionWrongPassword,
        );
      default:
        return LogInWithEmailAndPasswordFailure(
          LocaleStrings.loginExceptionSomethingWrong,
        );
    }
  }

  final String message;
}
