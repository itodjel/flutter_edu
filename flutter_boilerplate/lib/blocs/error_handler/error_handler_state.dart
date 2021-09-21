import 'package:rest_api_client/rest_api_client.dart';
import 'package:flutter_boilerplate/_all.dart';

enum ErrorHandlerStateStatus {
  clean,
  dirty,
}

class ErrorHandlerState {
  ErrorHandlerStateStatus status;
  BaseException? exception;

  ErrorHandlerState({
    required this.status,
    this.exception,
  });

  ErrorHandlerState copyWith({
    ErrorHandlerStateStatus? status,
    Optional<BaseException?>? exception,
  }) =>
      ErrorHandlerState(
        status: status ?? this.status,
        exception: exception != null ? exception.value : this.exception,
      );
}
