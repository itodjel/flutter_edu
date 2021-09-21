import 'package:flutter_boilerplate/_all.dart';

class LoginModel {
  String? userNameOrEmail;
  String? password;

  LoginModel({
    this.userNameOrEmail,
    this.password,
  });

  LoginModel copyWith({
    Optional<String?>? userNameOrEmail,
    Optional<String?>? password,
  }) {
    return LoginModel(
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
