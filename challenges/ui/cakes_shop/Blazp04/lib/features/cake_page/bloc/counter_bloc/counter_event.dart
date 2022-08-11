part of 'counter_bloc.dart';

@immutable
abstract class CounterEvent {}

class PovecajEvent extends CounterEvent{}

class SmanjiEvent extends CounterEvent{}
