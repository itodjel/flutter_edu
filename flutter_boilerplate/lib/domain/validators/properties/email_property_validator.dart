import 'package:flutter_boilerplate/_all.dart';

class EmailPropertyValidator extends PropertyValidator<String> {
  final Localizer localizer;
  final bool _required;

  EmailPropertyValidator({
    required this.localizer,
  }) : _required = false;

  EmailPropertyValidator.required({
    required this.localizer,
  }) : _required = true;

  @override
  String? validate(String? value) {
    if (!_required && !value.hasValue) {
      return null;
    }

    if (!value.hasValue) {
      return localizer.translations.fieldIsRequired;
    }

    if (!value.isEmail) {
      return localizer.translations.emailIsNotValid;
    }

    return null;
  }
}
