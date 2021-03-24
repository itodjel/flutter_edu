import 'dart:html';

import 'package:flutter/cupertino.dart';

abstract class CounterEvent {}

class IncrementCounterEvent extends CounterEvent {
  int counter;
  IncrementCounterEvent({@required this.counter}) : assert(counter != null);
}

class DecrementCounterEvent extends CounterEvent {
  int counter;
  DecrementCounterEvent({@required this.counter}) : assert(counter != null);
}
