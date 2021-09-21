import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_boilerplate/_all.dart';

void main() {
  test('Positive number property validator WHEN required SHOULD not allow input parameters to be null', () {
    final localizer = Localizer(const Locale('en'));
    final unit = PositiveNumberPropertyValidator.required(localizer: localizer);

    expect(unit.validate(null), localizer.translations.fieldIsRequired);
  });
}
