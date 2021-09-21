import 'package:flutter_boilerplate/_all.dart';

void showToast(String message) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.SNACKBAR,
    timeInSecForIosWeb: 4,
    backgroundColor: const Color(0xFF323232),
    textColor: Colors.white,
    fontSize: 12.0,
  );
}

void showInfoMessage(String message) {
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

void showInfoDialog({
  Function? onClose,
  String? message,
  String? buttonText,
  Widget? child,
}) {
  final context = globalNavigatorKey.currentState?.context;
  if (context != null) {
    showDialog(
      context: context,
      builder: (context) => InfoDialog(
        onClose: onClose,
        message: message,
        buttonText: buttonText,
        child: child,
      ),
    );
  }
}

void showActionDialog() {}
