import 'package:flutter_boilerplate/_all.dart';

class QuantityBloc extends Bloc<QuantityEvent, QuantityState> {
  final int numberOfDecimals;

  QuantityBloc({
    double value = 1,
    this.numberOfDecimals = 2,
  }) : super(initialState(value, numberOfDecimals)) {
    on<QuantityUpdateEvent>(_update);
    on<QuantityAddValueEvent>(_addValue);
  }

  static QuantityState initialState(double value, int numberOfDecimals) {
    return QuantityState(
      status: QuantityStateStatus.initializing,
      text: value.toStringAsFixed(numberOfDecimals),
      value: value,
    );
  }

  Future<void> _update(QuantityUpdateEvent event, Emitter<QuantityState> emit) async {
    final value = double.tryParse(event.text);

    if (value != null) {
      emit(state.copyWith(
        status: QuantityStateStatus.initial,
        text: value.toStringAsFixed(numberOfDecimals),
        value: value,
      ));
    }
  }

  Future<void> _addValue(QuantityAddValueEvent event, Emitter<QuantityState> emit) async {
    state.value = state.value + event.value;

    emit(state.copyWith(
      status: QuantityStateStatus.initial,
      text: state.value.toStringAsFixed(numberOfDecimals),
    ));
  }
}
