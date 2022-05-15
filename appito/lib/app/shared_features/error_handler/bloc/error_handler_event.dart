import 'package:appito/_all.dart';

abstract class ErrorHandlerEvent {}

class ErrorHandlerAddNewExceptionEvent extends ErrorHandlerEvent {
  final BaseException exception;

  ErrorHandlerAddNewExceptionEvent({required this.exception});
}
