import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/all.dart';

class Localizer {
  static LanguageModel get defaultLanguage => supportedLanguages[0];
  static final List<LanguageModel> supportedLanguages = [
    LanguageModel(
      code: 'en',
      name: 'English',
      translations: translation_en,
      iconPath: AppAssets.flag_uk,
    ),
    LanguageModel(
      code: 'bs',
      name: 'Bosanski',
      translations: translation_bs,
      iconPath: AppAssets.flag_ba,
    ),
  ];

  late TranslationModel translations;
  late LanguageModel currentLanguage;

  Localizer(Locale locale) {
    changeLanguage(locale);
  }

  void changeLanguage(Locale newLocale) {
    currentLanguage = supportedLanguages.firstWhere(
      (LanguageModel language) => language.locale.languageCode == newLocale.languageCode,
      orElse: () => defaultLanguage,
    );
    translations = currentLanguage.translations;
  }

  static Localizer of(BuildContext context) {
    return Localizations.of<Localizer>(context, Localizer)!;
  }

  static const _Delegate delegate = _Delegate();

  static Locale getSupportedLocale(Locale deviceLocale, Iterable<Locale> supportedLocales) {
    final deviceLocaleSupported = supportedLocales.any((Locale locale) => deviceLocale.languageCode == locale.languageCode);

    return deviceLocaleSupported ? deviceLocale : defaultLanguage.locale;
  }
}

class _Delegate extends LocalizationsDelegate<Localizer> {
  const _Delegate();

  @override
  bool isSupported(Locale locale) {
    return Localizer.supportedLanguages.map((LanguageModel language) => language.locale.languageCode).contains(locale.languageCode);
  }

  @override
  Future<Localizer> load(Locale locale) {
    return SynchronousFuture<Localizer>(Localizer(locale));
  }

  @override
  bool shouldReload(_Delegate old) => false;
}