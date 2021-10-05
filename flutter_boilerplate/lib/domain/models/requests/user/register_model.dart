import 'dart:io';

import 'package:flutter_boilerplate/_all.dart';
import 'package:rest_api_client/rest_api_client.dart';

class RegisterModel {
  String? email;
  String? firstName;
  String? lastName;
  String? password;
  String? passwordConfirmation;
  File? logo;
  String? logoUrl;

  RegisterModel({
    this.email,
    this.firstName,
    this.lastName,
    this.password,
    this.passwordConfirmation,
    this.logo,
    this.logoUrl,
  });

  RegisterModel copyWith({
    Optional<String?>? email,
    Optional<String?>? firstName,
    Optional<String?>? lastName,
    Optional<String?>? password,
    Optional<String?>? passwordConfirmation,
    Optional<File?>? logo,
    Optional<String?>? logoUrl,
  }) {
    return RegisterModel(
      email: email != null ? email.value : this.email,
      firstName: firstName != null ? firstName.value : this.firstName,
      lastName: lastName != null ? lastName.value : this.lastName,
      password: password != null ? password.value : this.password,
      passwordConfirmation: passwordConfirmation != null ? passwordConfirmation.value : this.passwordConfirmation,
      logo: logo != null ? logo.value : this.logo,
      logoUrl: logoUrl != null ? logoUrl.value : this.logoUrl,
    );
  }

  Future<Map<String, dynamic>> toMap() async {
    return {
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'password': password,
      'logo': logo != null ? await MultipartFile.fromFile(logo!.path) : null,
    };
  }
}
