import 'package:flutter_boilerplate/all.dart';
import 'package:permission_handler/permission_handler.dart';

extension PermissionExtension on Permission {
  Future<bool> check() async {
    if (await this.isGranted) {
      return true;
    }
    if (await this.isRestricted || await this.isDenied) {
      return (await this.request()).isGranted;
    }
    if (await this.isPermanentlyDenied) {
      showRequestRationale(this);
    }

    return false;
  }
}
