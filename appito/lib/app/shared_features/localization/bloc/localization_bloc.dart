import 'package:appito/_all.dart';
import 'package:intl/intl.dart';

class LocalizationBloc extends Bloc<LocalizationEvent, LocalizationState> {
  final IRestApiClient restApiClient;
  final IStorageRepository storageRepository;

  LocalizationBloc({
    required this.restApiClient,
    required this.storageRepository,
  }) : super(initialState()) {
    on<LocalizationInitEvent>(_init);
    on<LocalizationChangeEvent>(_change);

    add(LocalizationInitEvent());
  }

  static LocalizationState initialState() => LocalizationState(
        status: LocalizationStateStatus.initializing,
        locale: AppLanguages.values.first.locale,
      );

  Future<void> _init(LocalizationInitEvent event, Emitter<LocalizationState> emit) async {
    String? languageCode = await storageRepository.get(AppKeys.language_code);
    final languagePreviouslySelected = languageCode != null;
    final locale = languagePreviouslySelected ? Locale(languageCode) : AppLanguages.values.first.locale;

    Intl.defaultLocale = locale.languageCode;
    restApiClient.setAcceptLanguageHeader(locale.languageCode);

    emit(state.copyWith(status: languagePreviouslySelected ? LocalizationStateStatus.initialized : LocalizationStateStatus.initializedDefault, locale: locale));
  }

  Future<void> _change(LocalizationChangeEvent event, Emitter<LocalizationState> emit) async {
    await storageRepository.set(AppKeys.language_code, event.locale.languageCode);

    restApiClient.setAcceptLanguageHeader(event.locale.languageCode);
    Intl.defaultLocale = event.locale.languageCode;

    emit(state.copyWith(status: LocalizationStateStatus.changed, locale: event.locale));
    emit(state.copyWith(status: LocalizationStateStatus.initialized));
  }
}
