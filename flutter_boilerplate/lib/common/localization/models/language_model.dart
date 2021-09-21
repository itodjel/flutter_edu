import 'package:flutter_boilerplate/_all.dart';

class LanguageModel {
  final String name;
  final String iconPath;
  final Locale locale;
  final TranslationModel translations;

  LanguageModel({
    required String code,
    required this.name,
    required this.iconPath,
    required this.translations,
  }) : locale = Locale(code);
}
