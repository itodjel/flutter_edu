import 'package:flutter_boilerplate/_all.dart';

class SignInModel {
  String? userNameOrEmail;
  String? password;

  SignInModel({
    this.userNameOrEmail,
    this.password,
  });

  SignInModel copyWith({
    Optional<String?>? userNameOrEmail,
    Optional<String?>? password,
  }) {
    return SignInModel(
      userNameOrEmail: userNameOrEmail != null ? userNameOrEmail.value : this.userNameOrEmail,
      password: password != null ? password.value : this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userNameOrEmail': userNameOrEmail,
      'password': password,
    };
  }
}
