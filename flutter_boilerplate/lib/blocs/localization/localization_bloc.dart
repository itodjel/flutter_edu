import 'package:flutter_boilerplate/all.dart';
import 'package:rest_api_client/rest_api_client.dart';

class LocalizationBloc extends Bloc<LocalizationEvent, LocalizationState> {
  final IRestApiClient restApiClient;
  final IStorageRepository storageRepository;

  LocalizationBloc({
    required this.restApiClient,
    required this.storageRepository,
  }) : super(initialState());

  static LocalizationState initialState() => LocalizationState(
        status: LocalizationStateStatus.loading,
        locale: Localizer.defaultLanguage.locale,
      );

  @override
  Stream<LocalizationState> mapEventToState(LocalizationEvent event) async* {
    if (event is LocalizationLoadEvent) {
      yield* _load();
    } else if (event is LocalizationChangeEvent) {
      yield* _change(event);
    }
  }

  Stream<LocalizationState> _load() async* {
    final languageCode = await storageRepository.get(AppKeys.languageCode);
    final locale = languageCode == null ? Localizer.defaultLanguage.locale : Locale(languageCode);

    yield state.copyWith(status: LocalizationStateStatus.loaded, locale: locale);
    restApiClient.setAcceptLanguageHeader(languageCode);
  }

  Stream<LocalizationState> _change(LocalizationChangeEvent event) async* {
    restApiClient.setAcceptLanguageHeader(event.locale.languageCode);

    await storageRepository.set(AppKeys.languageCode, event.locale.languageCode);

    yield state.copyWith(status: LocalizationStateStatus.changed, locale: event.locale);
  }
}
