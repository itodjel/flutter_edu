import 'package:meta/meta.dart';

abstract class CounterEvent {}

class CounterChangeEvent extends CounterEvent {
  final int counter;
  CounterChangeEvent({this.counter = 0});
}

class IncrementEvent extends CounterEvent {}

class DecrementEvent extends CounterEvent {}
