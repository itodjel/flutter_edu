import 'package:flutter_boilerplate/all.dart';

class EmailPropertyValidator extends PropertyValidator<String?> {
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
    if (!_required && value == null) {
      return null;
    }

    if (value == null) {
      return localizer.translations.fieldIsRequired;
    }

    if (!value.isEmail) {
      return localizer.translations.emailIsNotValid;
    }

    return null;
  }
}
