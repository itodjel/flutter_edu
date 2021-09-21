import 'package:intl/intl.dart';
import 'package:flutter_boilerplate/_all.dart';
import 'package:rest_api_client/rest_api_client.dart';

class LocalizationBloc extends Bloc<LocalizationEvent, LocalizationState> {
  final IRestApiClient restApiClient;
  final IStorageRepository storageRepository;

  LocalizationBloc({
    required this.restApiClient,
    required this.storageRepository,
  }) : super(initialState());

  static LocalizationState initialState() => LocalizationState(
        status: LocalizationStateStatus.initializing,
        locale: Localizer.defaultLanguage.locale,
      );

  @override
  Stream<LocalizationState> mapEventToState(LocalizationEvent event) async* {
    if (event is LocalizationInitEvent) {
      yield* _init();
    } else if (event is LocalizationChangeEvent) {
      yield* _change(event);
    }
  }

  Stream<LocalizationState> _init() async* {
    final languageCode = await storageRepository.get(AppKeys.languageCode);
    final locale = languageCode == null ? Localizer.defaultLanguage.locale : Locale(languageCode);

    Intl.defaultLocale = locale.languageCode;

    yield state.copyWith(status: LocalizationStateStatus.initialized, locale: locale);
    restApiClient.setAcceptLanguageHeader(locale.languageCode);
  }

  Stream<LocalizationState> _change(LocalizationChangeEvent event) async* {
    restApiClient.setAcceptLanguageHeader(event.locale.languageCode);

    await storageRepository.set(AppKeys.languageCode, event.locale.languageCode);

    Intl.defaultLocale = event.locale.languageCode;

    yield state.copyWith(status: LocalizationStateStatus.changed, locale: event.locale);
  }
}
