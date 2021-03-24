abstract class CounterState {
  int counter;
  CounterState({this.counter = 0});
}

class CounterPressState extends CounterState {
  int counter;
  CounterPressState({this.counter = 0});
}

class LoadingState extends CounterState {}
