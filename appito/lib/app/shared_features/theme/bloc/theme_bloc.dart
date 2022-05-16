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
    final themeModeIndex = await storageRepository.get<int>(AppKeys.theme_mode);

    if (themeModeIndex == null) {
      emit(ThemeState(status: ThemeStateStatus.initialized, themeMode: ThemeMode.light));
    } else {
      emit(ThemeState(status: ThemeStateStatus.initialized, themeMode: ThemeMode.values[themeModeIndex]));
    }
  }

  Future<void> _change(ThemeChangeEvent event, Emitter<ThemeState> emit) async {
    await storageRepository.set(AppKeys.theme_mode, event.themeMode.index);

    emit(ThemeState(status: ThemeStateStatus.initialized, themeMode: event.themeMode));
  }
}
