import 'package:flutter_boilerplate/_all.dart';

class IntroductionBloc extends Bloc<IntroductionEvent, IntroductionState> {
  final IStorageRepository storageRepository;

  IntroductionBloc({
    required this.storageRepository,
  }) : super(initialState()) {
    on<IntroductionChangeIndexEvent>(_changeIndex);
    on<IntroductionSetIntroSeenEvent>(_setIntroSeen);
    on<IntroductionInitEvent>(_init);
  }

  static IntroductionState initialState() => IntroductionState(
        status: IntroductionStateStatus.loading,
        index: 0,
        isIntroSeen: true,
      );

  Future<void> _init(IntroductionInitEvent event, Emitter<IntroductionState> emit) async {
    final isIntroSeen = await storageRepository.get<bool>(AppKeys.isIntroSeen);

    emit(state.copyWith(
      status: IntroductionStateStatus.loaded,
      isIntroSeen: isIntroSeen.value,
    ));
  }

  Future<void> _changeIndex(IntroductionChangeIndexEvent event, Emitter<IntroductionState> emit) async {
    emit(state.copyWith(index: event.index));
  }

  Future<void> _setIntroSeen(IntroductionSetIntroSeenEvent event, Emitter<IntroductionState> emit) async {
    await storageRepository.set(AppKeys.isIntroSeen, true);

    emit(state.copyWith(
      status: IntroductionStateStatus.loaded,
      isIntroSeen: true,
    ));
  }
}
