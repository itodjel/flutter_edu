import 'package:appito/_all.dart';

IToast get toast => services.get<IToast>();

abstract class IToast {
  void success({String? message, Widget? child, bool showIcon = true});
  void validation({String? message, Widget? child});
  void error({String? message, Widget? child, bool showIcon = true});
  void showExceptionMessage(AppLocalizations appLocalizations, BaseException exception);
}

class Toast implements IToast {
  @override
  void success({String? message, Widget? child, bool showIcon = true}) {
    _showMessage(
      ToastContainer(
        message: message,
        leading: Icons.check_circle_outline,
        color: const Color(0xFF00663F),
        child: child,
      ),
    );
  }

  @override
  void validation({String? message, Widget? child}) {
    _showMessage(
      ToastContainer(
        message: message,
        color: const Color(0xFF323232),
        child: child,
      ),
    );
  }

  @override
  void error({String? message, Widget? child, bool showIcon = true}) {
    _showMessage(
      ToastContainer(
        message: message,
        leading: Icons.cancel_outlined,
        color: Colors.red[400],
        child: child,
      ),
    );
  }

  @override
  void showExceptionMessage(AppLocalizations appLocalizations, BaseException exception) {
    final messages = List<String>.from(exception.messages);

    if (messages.isEmpty) {
      messages.add(_getDefaultErrorMessageForException(appLocalizations, exception));
    }

    final message = messages.join('\n');

    switch (exception.runtimeType) {
      case ValidationException:
        validation(message: message);
        break;
      case ServerErrorException:
        error(message: message);
        break;
      case NetworkErrorException:
        error(message: message);
        break;
      case ForbiddenException:
        error(message: message);
        break;
      case UnauthorizedException:
        error(message: message);
        break;
      default:
        error(message: message);
    }
  }

  String _getDefaultErrorMessageForException(AppLocalizations appLocalizations, BaseException exception) {
    if (exception is ServerErrorException) {
      return appLocalizations.there_was_a_server_error_please_try_again_later;
    }
    if (exception is NetworkErrorException) {
      return appLocalizations.there_was_a_network_error_please_try_again_later;
    }
    if (exception is ValidationException) {
      return appLocalizations.there_was_a_validation_error_please_fix_and_try_again;
    }

    return appLocalizations.there_was_an_error;
  }

  void _showMessage(ToastContainer toastContainer) {
    final context = globalNavigatorKey.currentState?.context;

    if (context != null) {
      ScaffoldMessenger.of(context).removeCurrentSnackBar();

      ScaffoldMessenger.of(context).showSnackBar(toastContainer);
    }
  }
}

class ToastContainer extends SnackBar {
  final String? message;
  final Widget? child;
  final IconData? leading;
  final Color? color;
  final Color? textColor;

  ToastContainer({
    Key? key,
    this.message,
    this.child,
    this.leading,
    this.color,
    this.textColor,
  }) : super(
          key: key,
          content: Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: color ?? const Color(0xFF323232),
              borderRadius: BorderRadius.circular(8),
            ),
            child: () {
              final content = child ??
                  Text(
                    message.value,
                    style: TextStyle(
                      color: textColor ?? Colors.white,
                    ),
                    softWrap: true,
                  );

              return leading != null
                  ? Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Icon(leading, color: Colors.white),
                        ),
                        const SizedBox(width: 15),
                        Expanded(child: content),
                      ],
                    )
                  : content;
            }(),
          ),
          padding: const EdgeInsets.all(10),
          duration: const Duration(seconds: 3),
          backgroundColor: Colors.transparent,
          elevation: 0,
        );
}
