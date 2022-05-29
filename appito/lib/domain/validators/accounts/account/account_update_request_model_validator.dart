import 'package:appito/_all.dart';

class AccountUpdateRequestModelValidator extends ModelValidator {
  final AppLocalizations appLocalizations;

  AccountUpdateRequestModelValidator({
    required this.appLocalizations,
  });

  String? userName(AccountUpdateRequestModel model) => !model.userName.hasValue ? appLocalizations.field_is_required : null;

  @override
  bool validate(model) => messages(model).isEmpty;

  @override
  List<String> messages(model) {
    return [
      userName(model),
    ].where((x) => x.hasValue).map((x) => x as String).toList();
  }
}
