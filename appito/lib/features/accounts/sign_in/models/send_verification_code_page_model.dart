import 'package:appito/_all.dart';

class SendVerificationCodePageModel {
  final bool allowTypeToggle;
  final VerificationCodeSourceType type;
  final String? source;

  SendVerificationCodePageModel({
    this.allowTypeToggle = true,
    this.type = VerificationCodeSourceType.email,
    this.source,
  });
}
