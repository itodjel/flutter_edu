enum CounterStateStatus { loading, loaded }

class CounterState {
  CounterStateStatus status;

  int counter;
  CounterState({this.counter = 0, this.status});
  CounterState copyWith({CounterStateStatus status, int counter}) =>
      CounterState(
        status: status ?? this.status,
        counter: counter ?? this.counter,
      );
}
