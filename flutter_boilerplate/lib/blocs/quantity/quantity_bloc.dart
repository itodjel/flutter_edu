import 'package:flutter_boilerplate/_all.dart';

class QuantityBloc extends Bloc<QuantityEvent, QuantityState> {
  final int numberOfDecimals;

  QuantityBloc({
    double value = 1,
    this.numberOfDecimals = 2,
  }) : super(QuantityState(
          status: QuantityStateStatus.initializing,
          text: value.toStringAsFixed(numberOfDecimals),
          value: value,
        ));

  @override
  Stream<QuantityState> mapEventToState(QuantityEvent event) async* {
    if (event is QuantityUpdateEvent) {
      yield* _update(event);
    } else if (event is QuantityAddValueEvent) {
      yield* _addValue(event);
    }
  }

  Stream<QuantityState> _update(QuantityUpdateEvent event) async* {
    final value = double.tryParse(event.text);

    if (value != null) {
      yield state.copyWith(
        status: QuantityStateStatus.initial,
        text: value.toStringAsFixed(numberOfDecimals),
        value: value,
      );
    }
  }

  Stream<QuantityState> _addValue(QuantityAddValueEvent event) async* {
    state.value = state.value + event.value;

    yield state.copyWith(
      status: QuantityStateStatus.initial,
      text: state.value.toStringAsFixed(numberOfDecimals),
    );
  }
}
