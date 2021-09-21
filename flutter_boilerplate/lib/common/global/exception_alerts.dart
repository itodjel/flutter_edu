import 'package:flutter_boilerplate/_all.dart';
import 'package:rest_api_client/rest_api_client.dart';

void showExceptionMessage(BuildContext context, BaseException exception) {
  final messages = List<String>.from(exception.messages);

  if (messages.isEmpty) {
    messages.add(_getDefaultErrorMessageForException(context, exception));
  }

  final message = messages.join('\n');

  switch (exception.runtimeType) {
    case ValidationException:
      _showErrorMessageSnackBar(message);
      break;
    case ServerErrorException:
      _showErrorMessageToast(message);
      break;
    case NetworkErrorException:
      _showErrorMessageToast(message);
      break;
    case ForbiddenException:
      //...
      break;
    case UnauthorizedException:
      //...
      break;
  }
}

void _showErrorMessageToast(String message) {
  Fluttertoast.cancel();

  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.TOP,
    timeInSecForIosWeb: 4,
    backgroundColor: const Color(0xFF323232),
    textColor: Colors.white,
    fontSize: 12.0,
  );
}

void _showErrorMessageSnackBar(String message) {
  final context = globalNavigatorKey.currentState?.context;

  if (context != null) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 3),
      ),
    );
  }
}

String _getDefaultErrorMessageForException(BuildContext context, BaseException exception) {
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
