part of 'counter_bloc.dart';

class CounterState {
  int kolicina;
  CounterState({
    required this.kolicina,
  });

  CounterState copyWith({
    int? kolicina,
  }) {
    return CounterState(
      kolicina: kolicina ?? this.kolicina,
    );
  }
}
