enum CounterStateStatus { Loading, Loaded, SuccessfullyUpdated }

class CounterState {
  CounterStateStatus stateStatus;

  int counter;
  CounterState({this.counter = 0, this.stateStatus});
  CounterState copyWith({CounterStateStatus stateStatus, int counter}) =>
      CounterState(
        stateStatus: stateStatus ?? this.stateStatus,
        counter: counter ?? this.counter,
      );
}
