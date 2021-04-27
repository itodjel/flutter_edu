import 'package:rest_api_client/rest_api_client.dart';

enum ErrorHandlerStateStatus {
  clean,
  dirty,
}

class ErrorHandlerState {
  ErrorHandlerStateStatus status;
  RestApiClientException? exception;

  ErrorHandlerState({
    required this.status,
    this.exception,
  });

  ErrorHandlerState copyWith({
    ErrorHandlerStateStatus? status,
    RestApiClientException? exception,
  }) =>
      ErrorHandlerState(
        status: status ?? this.status,
        exception: exception ?? this.exception,
      );
}
