import 'package:appito/_all.dart';

class ChangePasswordRequestModelValidator extends ModelValidator {
  final AppLocalizations appLocalizations;

  ChangePasswordRequestModelValidator({
    required this.appLocalizations,
  });

  String? password(ChangePasswordRequestModel model) => !model.password.hasValue ? appLocalizations.field_is_required : null;

  @override
  bool validate(model) => messages(model).isEmpty;

  @override
  List<String> messages(model) {
    return [
      password(model),
    ].where((x) => x.hasValue).map((x) => x as String).toList();
  }
}
