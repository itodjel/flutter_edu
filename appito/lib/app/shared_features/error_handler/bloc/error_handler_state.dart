import 'package:appito/_all.dart';

enum ErrorHandlerStateStatus {
  clean,
  dirty,
}

class ErrorHandlerState {
  ErrorHandlerStateStatus status;
  BaseException? exception;

  bool get showMessage => status == ErrorHandlerStateStatus.dirty && exception != null && !(exception?.silent ?? false);

  ErrorHandlerState({
    required this.status,
    this.exception,
  });

  ErrorHandlerState copyWith({
    ErrorHandlerStateStatus? status,
    BaseException? exception,
  }) =>
      ErrorHandlerState(
        status: status ?? this.status,
        exception: exception ?? this.exception,
      );
}
