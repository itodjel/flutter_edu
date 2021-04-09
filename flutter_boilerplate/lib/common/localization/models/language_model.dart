import 'dart:ui';
import 'translation_model.dart';

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
