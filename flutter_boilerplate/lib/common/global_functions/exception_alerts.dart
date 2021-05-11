import 'package:flutter_boilerplate/all.dart';
import 'package:rest_api_client/rest_api_client.dart';

void showExceptionMessage(BuildContext context, RestApiClientException exception) {
  final messages = List.from(exception.messages);

  if (messages.isNullOrEmpty()) {
    messages.add(_getDefaultErrorMessageForException(context, exception));
  }

  Fluttertoast.cancel();

  Fluttertoast.showToast(
    msg: messages.join('\n'),
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.TOP,
    timeInSecForIosWeb: 4,
    backgroundColor: const Color(0xFF323232),
    textColor: Colors.white,
    fontSize: 12.0,
  );
}

String _getDefaultErrorMessageForException(BuildContext context, RestApiClientException exception) {
  if (exception is ServerErrorException) {
    return context.translations.serverErrorException;
  }
  if (exception is NetworkErrorException) {
    return context.translations.networkErrorException;
  }
  if (exception is ValidationException) {
    return context.translations.validationError;
  }

  return context.translations.thereWasAnError;
}
