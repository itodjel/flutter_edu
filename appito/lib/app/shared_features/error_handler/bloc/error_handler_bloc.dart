import 'package:appito/_all.dart';

class ErrorHandlerBloc extends Bloc<ErrorHandlerEvent, ErrorHandlerState> {
  final IRestApiClient restApiClient;
  late StreamSubscription _restApiClientSubscription;

  ErrorHandlerBloc({
    required this.restApiClient,
  }) : super(ErrorHandlerState(status: ErrorHandlerStateStatus.clean)) {
    on<ErrorHandlerAddNewExceptionEvent>(_addNewException);

    _restApiClientSubscription = restApiClient.exceptionHandler.exceptions.stream.listen((exception) {
      add(ErrorHandlerAddNewExceptionEvent(exception: exception));
    });
  }

  Future<void> _addNewException(ErrorHandlerAddNewExceptionEvent event, Emitter<ErrorHandlerState> emit) async {
    emit(
      ErrorHandlerState(
        status: ErrorHandlerStateStatus.dirty,
        exception: event.exception,
      ),
    );
  }

  @override
  Future<void> close() {
    _restApiClientSubscription.cancel();

    return super.close();
  }
}
