import 'package:appito/_all.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  final IStorageRepository storageRepository;

  ThemeBloc({
    required this.storageRepository,
  }) : super(initialState()) {
    on<ThemeInitEvent>(_init);
    on<ThemeChangeEvent>(_change);

    add(ThemeInitEvent());
  }

  static ThemeState initialState() => ThemeState(
        status: ThemeStateStatus.initializing,
        themeMode: ThemeMode.light,
      );

  Future<void> _init(ThemeInitEvent event, Emitter<ThemeState> emit) async {
    int? themeModeIndex = await storageRepository.get(AppKeys.theme_mode);

    add(ThemeChangeEvent(themeMode: themeModeIndex == null ? ThemeMode.light : ThemeMode.values[themeModeIndex]));
  }

  Future<void> _change(ThemeChangeEvent event, Emitter<ThemeState> emit) async {
    await storageRepository.set(AppKeys.theme_mode, event.themeMode.index);

    emit(ThemeState(status: ThemeStateStatus.initialized, themeMode: event.themeMode));
  }
}
