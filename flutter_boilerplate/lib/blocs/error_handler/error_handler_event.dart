import 'package:rest_api_client/rest_api_client.dart';

abstract class ErrorHandlerEvent {}

class ErrorHandlerAddNewExceptionEvent extends ErrorHandlerEvent {
  final BaseException exception;

  ErrorHandlerAddNewExceptionEvent({required this.exception});
}
