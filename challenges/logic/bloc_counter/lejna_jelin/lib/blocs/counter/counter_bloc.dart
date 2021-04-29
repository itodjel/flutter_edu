import 'dart:async';
import 'package:bloc/bloc.dart';

import 'all.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc()
      : super(CounterState(counter: 0, status: CounterStateStatus.loaded));
  @override
  Stream<CounterState> mapEventToState(CounterEvent event) async* {
    if (event is IncrementEvent)
      yield* _increment(event);
    else if (event is DecrementEvent) yield* _decrement(event);
  }

  Stream<CounterState> _increment(IncrementEvent event) async* {
    yield state.copyWith(status: CounterStateStatus.loading);
    await Future.delayed(Duration(seconds: 3));
    yield state.copyWith(
        status: CounterStateStatus.loaded, counter: state.counter += 2);
  }

  Stream<CounterState> _decrement(DecrementEvent event) async* {
    yield state.copyWith(status: CounterStateStatus.loading);
    await Future.delayed(Duration(seconds: 3));
    yield state.copyWith(
        status: CounterStateStatus.loaded, counter: state.counter -= 1);
  }
}
