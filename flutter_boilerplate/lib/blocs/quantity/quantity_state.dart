enum QuantityStateStatus {
  initializing,
  initial,
}

class QuantityState {
  QuantityStateStatus status;
  String text;
  double value;

  QuantityState({
    required this.status,
    required this.text,
    required this.value,
  });

  QuantityState copyWith({
    QuantityStateStatus? status,
    String? text,
    double? value,
  }) =>
      QuantityState(
        status: status ?? this.status,
        text: text ?? this.text,
        value: value ?? this.value,
      );
}
