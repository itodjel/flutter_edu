abstract class QuantityEvent {}

class QuantityUpdateEvent extends QuantityEvent {
  final String text;

  QuantityUpdateEvent({required this.text});
}

class QuantityAddValueEvent extends QuantityEvent {
  final double value;

  QuantityAddValueEvent({required this.value});
}
