enum IntroStateStatus {
  initializing,
  unfinished,
  finished,
}

class IntroState {
  IntroStateStatus status;

  IntroState({
    required this.status,
  });

  IntroState copyWith({
    IntroStateStatus? status,
  }) {
    return IntroState(
      status: status ?? this.status,
    );
  }
}
