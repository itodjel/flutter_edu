import 'package:flutter_boilerplate/_all.dart';
import 'package:rest_api_client/rest_api_client.dart';

class ErrorHandlerBloc extends Bloc<ErrorHandlerEvent, ErrorHandlerState> {
  final IRestApiClient restApiClient;
  late StreamSubscription _restApiClientSubscription;

  ErrorHandlerBloc({
    required this.restApiClient,
  }) : super(initialState()) {
    on<ErrorHandlerAddNewExceptionEvent>(_addNewException);

    _restApiClientSubscription = restApiClient.exceptions.stream.listen((exception) {
      add(ErrorHandlerAddNewExceptionEvent(exception: exception));
    });
  }

  static ErrorHandlerState initialState() => ErrorHandlerState(status: ErrorHandlerStateStatus.clean);

  Future<void> _addNewException(ErrorHandlerAddNewExceptionEvent event, Emitter<ErrorHandlerState> emit) async {
    emit(ErrorHandlerState(status: ErrorHandlerStateStatus.dirty, exception: event.exception));
    // emit(ErrorHandlerState(status: ErrorHandlerStateStatus.clean, exception: null));
  }

  @override
  Future<void> close() {
    _restApiClientSubscription.cancel();
    return super.close();
  }
}
