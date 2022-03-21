import 'package:intl/intl.dart';
import 'package:flutter_boilerplate/_all.dart';
import 'package:rest_api_client/rest_api_client.dart';

class LocalizationBloc extends Bloc<LocalizationEvent, LocalizationState> {
  final IRestApiClient restApiClient;
  final IStorageRepository storageRepository;

  LocalizationBloc({
    required this.restApiClient,
    required this.storageRepository,
  }) : super(initialState()) {
    on<LocalizationInitEvent>(_init);
    on<LocalizationChangeEvent>(_change);
  }

  static LocalizationState initialState() => LocalizationState(
        status: LocalizationStateStatus.initializing,
        locale: Localizer.defaultLanguage.locale,
      );

  Future<void> _init(LocalizationInitEvent event, Emitter<LocalizationState> emit) async {
    final languageCode = await storageRepository.get(AppKeys.languageCode);
    final locale = languageCode == null ? Localizer.defaultLanguage.locale : Locale(languageCode);

    Intl.defaultLocale = locale.languageCode;

    emit(state.copyWith(status: LocalizationStateStatus.initialized, locale: locale));
    restApiClient.setAcceptLanguageHeader(locale.languageCode);
  }

  Future<void> _change(LocalizationChangeEvent event, Emitter<LocalizationState> emit) async {
    restApiClient.setAcceptLanguageHeader(event.locale.languageCode);

    await storageRepository.set(AppKeys.languageCode, event.locale.languageCode);

    Intl.defaultLocale = event.locale.languageCode;

    emit(state.copyWith(status: LocalizationStateStatus.changed, locale: event.locale));
  }
}
