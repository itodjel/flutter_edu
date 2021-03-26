import 'package:flutter/cupertino.dart';

abstract class ButtonEvent {}

class ButtonPressEvent extends ButtonEvent {
  final int index;
  ButtonPressEvent({@required this.index}) : assert(index != null);
}
