import 'package:flutter_boilerplate/all.dart';
import 'package:rest_api_client/rest_api_client.dart';

class ErrorHandlerBloc extends Bloc<ErrorHandlerEvent, ErrorHandlerState> {
  final IRestApiClient restApiClient;

  ErrorHandlerBloc({
    required this.restApiClient,
  }) : super(ErrorHandlerState(status: ErrorHandlerStateStatus.clean)) {
    restApiClient.exceptions.stream.listen((exception) {
      add(AddNewExceptionErrorHandlerEvent(exception: exception));
    });
  }

  @override
  Stream<ErrorHandlerState> mapEventToState(ErrorHandlerEvent event) async* {
    if (event is AddNewExceptionErrorHandlerEvent) {
      yield* _addNewException(event);
    }
  }

  Stream<ErrorHandlerState> _addNewException(AddNewExceptionErrorHandlerEvent event) async* {
    yield ErrorHandlerState(status: ErrorHandlerStateStatus.dirty, exception: event.exception);
    yield ErrorHandlerState(status: ErrorHandlerStateStatus.clean, exception: null);
  }
}
