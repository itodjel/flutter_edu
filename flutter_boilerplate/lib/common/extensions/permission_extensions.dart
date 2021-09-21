import 'package:flutter_boilerplate/_all.dart';
import 'package:permission_handler/permission_handler.dart';

extension PermissionExtension on Permission {
  Future<bool> check() async {
    if (await isGranted) {
      return true;
    }
    if (await isRestricted || await isDenied) {
      return (await request()).isGranted;
    }
    if (await isPermanentlyDenied) {
      return await showRequestRationale(this);
    }

    return false;
  }
}
