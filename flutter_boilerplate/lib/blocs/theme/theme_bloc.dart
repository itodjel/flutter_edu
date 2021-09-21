import 'package:flutter_boilerplate/_all.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  final IStorageRepository storageRepository;

  ThemeBloc({
    required this.storageRepository,
  }) : super(initialState());

  static ThemeState initialState() => ThemeState(
        status: ThemeStateStatus.initializing,
        themeMode: ThemeMode.light,
      );

  @override
  Stream<ThemeState> mapEventToState(ThemeEvent event) async* {
    if (event is ThemeInitEvent) {
      yield* _init();
    } else if (event is ThemeChangeEvent) {
      yield* _change(event);
    }
  }

  Stream<ThemeState> _init() async* {
    final themeModeIndex = await storageRepository.get<int>(AppKeys.themeMode);

    if (themeModeIndex == null) {
      yield ThemeState(status: ThemeStateStatus.initialized, themeMode: ThemeMode.light);
    } else {
      yield ThemeState(status: ThemeStateStatus.initialized, themeMode: ThemeMode.values[themeModeIndex]);
    }
  }

  Stream<ThemeState> _change(ThemeChangeEvent event) async* {
    await storageRepository.set(AppKeys.themeMode, event.themeMode.index);

    yield ThemeState(status: ThemeStateStatus.initialized, themeMode: event.themeMode);
  }
}
