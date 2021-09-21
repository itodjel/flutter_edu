import 'package:rest_api_client/rest_api_client.dart';

abstract class ErrorHandlerEvent {}

class AddNewExceptionErrorHandlerEvent extends ErrorHandlerEvent {
  final BaseException exception;

  AddNewExceptionErrorHandlerEvent({required this.exception});
}
