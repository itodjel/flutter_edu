import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:luka_jelacic/blocs/counter_event.dart';
import 'package:luka_jelacic/blocs/counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterPressState(counter: 0));
  @override
  Stream<CounterState> mapEventToState(CounterEvent event) async* {
    if (event is IncrementCounterEvent) {
      yield* increment(event);
    } else {
      yield* decrement(event);
    }
  }

  Stream<CounterState> increment(IncrementCounterEvent event) async* {
    yield LoadingState();
    await Future.delayed(Duration(seconds: 1));
    yield CounterPressState(counter: event.counter += 1);
  }

  Stream<CounterState> decrement(DecrementCounterEvent event) async* {
    yield LoadingState();
    await Future.delayed(Duration(seconds: 1));
    yield CounterPressState(counter: event.counter -= 1);
  }
}
