import 'package:flutter_boilerplate/_all.dart';

class ResetPasswordModel {
  String? code;
  String? newPassword;
  String? passwordConfirmation;
  String? email;

  ResetPasswordModel({
    this.code,
    this.newPassword,
    this.passwordConfirmation,
    this.email,
  });

  ResetPasswordModel copyWith({
    Optional<String?>? code,
    Optional<String?>? newPassword,
    Optional<String?>? passwordConfirmation,
    Optional<String?>? email,
  }) =>
      ResetPasswordModel(
        code: code != null ? code.value : this.code,
        newPassword: newPassword != null ? newPassword.value : this.newPassword,
        passwordConfirmation: passwordConfirmation != null ? passwordConfirmation.value : this.passwordConfirmation,
        email: email != null ? email.value : this.email,
      );

  Map<String, dynamic> toMap() {
    return {
      'code': code,
      'newPassword': newPassword,
      'passwordConfirmation': passwordConfirmation,
      'email': email,
    };
  }
}
