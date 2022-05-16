import 'package:appito/_all.dart';

class LanguageModel {
  final String name;
  final String iconPath;
  final Locale locale;

  LanguageModel({
    required String code,
    required this.name,
    required this.iconPath,
  }) : locale = Locale(code);
}
