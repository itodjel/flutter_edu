import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'models/language_model.dart';
import 'models/translation_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/_all.dart';

class Localizer {
  static LanguageModel get defaultLanguage => supportedLanguages[0];
  static final List<LanguageModel> supportedLanguages = [
    LanguageModel(
      code: 'en',
      name: 'English',
      translations: translationEnglish,
      iconPath: AppAssets.flagUK,
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
  static const _FallbackCupertinoLocalisationsDelegate fallbackCupertinoLocalisationsDelegate = _FallbackCupertinoLocalisationsDelegate();

  static Locale getSupportedLocale(Locale? deviceLocale, Iterable<Locale>? supportedLocales) {
    if (deviceLocale == null) {
      return defaultLanguage.locale;
    }

    final deviceLocaleSupported = supportedLocales?.any((Locale locale) => deviceLocale.languageCode == locale.languageCode) ?? false;

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

class _FallbackCupertinoLocalisationsDelegate extends LocalizationsDelegate<CupertinoLocalizations> {
  const _FallbackCupertinoLocalisationsDelegate();

  @override
  bool isSupported(Locale locale) => true;

  @override
  Future<CupertinoLocalizations> load(Locale locale) => DefaultCupertinoLocalizations.load(locale);

  @override
  bool shouldReload(_FallbackCupertinoLocalisationsDelegate old) => false;
}
