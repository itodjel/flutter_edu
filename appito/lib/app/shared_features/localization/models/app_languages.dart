import 'package:appito/_all.dart';

abstract class AppLanguages {
  static final List<LanguageModel> values = [
    LanguageModel(
      code: 'en',
      name: 'English',
      iconPath: AppAssets.images_flags_us,
    ),
    LanguageModel(
      code: 'bs',
      name: 'Bosanski',
      iconPath: AppAssets.images_flags_bs,
    ),
  ];
}
