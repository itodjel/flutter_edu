enum IntroductionStateStatus {
  loading,
  loaded,
}

class IntroductionState {
  IntroductionStateStatus status;
  int index;
  bool isIntroSeen;

  IntroductionState({
    required this.status,
    required this.index,
    required this.isIntroSeen,
  });

  IntroductionState copyWith({
    IntroductionStateStatus? status,
    int? index,
    bool? isIntroSeen,
  }) =>
      IntroductionState(
        status: status ?? this.status,
        index: index ?? this.index,
        isIntroSeen: isIntroSeen ?? this.isIntroSeen,
      );
}
