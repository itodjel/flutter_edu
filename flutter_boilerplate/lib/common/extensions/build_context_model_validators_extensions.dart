import 'package:flutter_boilerplate/_all.dart';

extension BuildContextModelValidatorsExtensions on BuildContext {
  SignInModelValidator get signInModelValidator => read<SignInModelValidator>();
  RegisterModelValidator get registerModelValidator => read<RegisterModelValidator>();
  ResetPasswordModelValidator get resetPasswordModelValidator => read<ResetPasswordModelValidator>();
}
