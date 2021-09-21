import 'package:flutter_boilerplate/_all.dart';

extension BuildContextModelValidatorsExtensions on BuildContext {
  LoginModelValidator get loginModelValidator => read<LoginModelValidator>();
  RegisterModelValidator get registerModelValidator => read<RegisterModelValidator>();
  ResetPasswordModelValidator get resetPasswordModelValidator => read<ResetPasswordModelValidator>();
}
