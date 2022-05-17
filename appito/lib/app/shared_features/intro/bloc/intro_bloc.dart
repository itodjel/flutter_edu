import 'package:appito/_all.dart';

class IntroBloc extends Bloc<IntroEvent, IntroState> {
  final IStorageRepository storageRepository;

  IntroBloc({
    required this.storageRepository,
  }) : super(initialState()) {
    on<IntroInitEvent>(_init);
    on<IntroFinishEvent>(_finish);

    add(IntroInitEvent());
  }

  static IntroState initialState() => IntroState(
        status: IntroStateStatus.initializing,
      );

  Future<void> _init(IntroInitEvent event, Emitter<IntroState> emit) async {
    final seen = await storageRepository.get<bool>(AppKeys.is_intro_seen);

    emit(IntroState(status: seen.value ? IntroStateStatus.finished : IntroStateStatus.unfinished));
  }

  Future<void> _finish(IntroFinishEvent event, Emitter<IntroState> emit) async {
    await storageRepository.set(AppKeys.is_intro_seen, true);

    emit(IntroState(status: IntroStateStatus.finished));
  }
}
