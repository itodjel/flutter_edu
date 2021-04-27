import 'package:flutter_boilerplate/all.dart';

class EmailPropertyValidator extends PropertyValidator<String?> {
  final Localizer localizer;
  bool _required;

  EmailPropertyValidator({
    required this.localizer,
  }) : _required = false;

  EmailPropertyValidator.required({
    required this.localizer,
  }) : _required = true;

  @override
  String? validate(String? text) {
    if (!_required && text == null) {
      return null;
    }

    if (text == null) {
      return localizer.translations.fieldIsRequired;
    }

    if (!text.isEmail) {
      return localizer.translations.emailIsNotValid;
    }

    return null;
  }
}
