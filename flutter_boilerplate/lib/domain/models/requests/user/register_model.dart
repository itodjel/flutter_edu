import 'package:flutter_boilerplate/_all.dart';

class RegisterModel {
  String? email;
  String? firstName;
  String? lastName;
  String? password;
  String? passwordConfirmation;

  RegisterModel({
    this.email,
    this.firstName,
    this.lastName,
    this.password,
    this.passwordConfirmation,
  });

  RegisterModel copyWith({
    Optional<String?>? email,
    Optional<String?>? firstName,
    Optional<String?>? lastName,
    Optional<String?>? password,
    Optional<String?>? passwordConfirmation,
  }) {
    return RegisterModel(
      email: email != null ? email.value : this.email,
      firstName: firstName != null ? firstName.value : this.firstName,
      lastName: lastName != null ? lastName.value : this.lastName,
      password: password != null ? password.value : this.password,
      passwordConfirmation: passwordConfirmation != null ? passwordConfirmation.value : this.passwordConfirmation,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'password': password,
    };
  }
}
