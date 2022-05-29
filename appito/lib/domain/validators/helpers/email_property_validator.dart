import 'package:appito/_all.dart';

class EmailPropertyValidator extends PropertyValidator<String> {
  final AppLocalizations appLocalizations;
  final bool _required;

  EmailPropertyValidator({
    required this.appLocalizations,
  }) : _required = false;

  EmailPropertyValidator.required({
    required this.appLocalizations,
  }) : _required = true;

  @override
  String? validate(String? value) {
    if (!_required && !value.hasValue) {
      return null;
    }

    if (!value.hasValue) {
      return appLocalizations.field_is_required;
    }

    if (!RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$').hasMatch(value.value)) {
      return appLocalizations.email_is_not_valid;
    }

    return null;
  }
}
