import 'package:flutter_boilerplate/_all.dart';

class PositiveNumberPropertyValidator extends PropertyValidator<num> {
  final Localizer localizer;
  final bool _required;

  PositiveNumberPropertyValidator({
    required this.localizer,
  }) : _required = false;

  PositiveNumberPropertyValidator.required({
    required this.localizer,
  }) : _required = true;

  @override
  String? validate(num? value) {
    if (!_required && value == null) {
      return null;
    }

    if (_required && value == null) {
      return localizer.translations.fieldIsRequired;
    }

    if (value != null && value < 0) {
      return localizer.translations.valueMustBeAPositiveNumber;
    }

    return null;
  }
}
