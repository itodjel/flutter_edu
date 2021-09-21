import 'package:flutter_boilerplate/_all.dart';

extension BuildContextPropertyValidatorsExtensions on BuildContext {
  EmailPropertyValidator get emailValidator => read<EmailPropertyValidator>();
  PositiveNumberPropertyValidator get positiveNumberPropertyValidator => read<PositiveNumberPropertyValidator>();
}
