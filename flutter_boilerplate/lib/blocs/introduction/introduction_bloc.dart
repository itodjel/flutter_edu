import 'package:flutter_boilerplate/_all.dart';

class IntroductionBloc extends Bloc<IntroductionEvent, IntroductionState> {
  final IStorageRepository storageRepository;

  IntroductionBloc({
    required this.storageRepository,
  }) : super(initialState());

  static IntroductionState initialState() => IntroductionState(
        status: IntroductionStateStatus.loading,
        index: 0,
        isIntroSeen: true,
      );

  @override
  Stream<IntroductionState> mapEventToState(IntroductionEvent event) async* {
    if (event is IntroductionChangeIndexEvent) {
      yield* _changeIndex(event);
    } else if (event is IntroductionSetIntroSeenEvent) {
      yield* _setIntro();
    } else if (event is IntroductionInitEvent) {
      yield* _init();
    }
  }

  Stream<IntroductionState> _init() async* {
    final isIntroSeen = await storageRepository.get<bool>(AppKeys.isIntroSeen);

    yield state.copyWith(
      status: IntroductionStateStatus.loaded,
      isIntroSeen: isIntroSeen.value,
    );
  }

  Stream<IntroductionState> _changeIndex(IntroductionChangeIndexEvent event) async* {
    yield state.copyWith(index: event.index);
  }

  Stream<IntroductionState> _setIntro() async* {
    await storageRepository.set(AppKeys.isIntroSeen, true);

    yield state.copyWith(
      status: IntroductionStateStatus.loaded,
      isIntroSeen: true,
    );
  }
}
