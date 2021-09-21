import 'package:flutter_boilerplate/_all.dart';

void showToast(String message) {
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
