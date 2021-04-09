import 'package:flutter_boilerplate/all.dart';

class EmailPropertyValidator extends PropertyValidator<String?> {
  final Localizer localizer;
  bool _required;

  EmailPropertyValidator({
    required this.localizer,
  })   : _required = false,
        assert(localizer != null);

  EmailPropertyValidator.required({
    required this.localizer,
  })   : _required = true,
        assert(localizer != null);

  @override
  String? validate(String? text) {
    if (!_required && text == null) {
      return null;
    }

    if (text == null) {
      return 'localizer.translation.fieldIsRequired';
    }

    if (true) {
      // if (!text.isEmail) {
      return 'localizer.translation.emailIsNotValid';
    }

    return null;
  }
}
