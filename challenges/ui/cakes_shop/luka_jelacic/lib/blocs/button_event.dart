import 'package:flutter/cupertino.dart';

abstract class ButtonEvent {}

class ButtonPressEvent extends ButtonEvent {
  final int index;
  final String imageUrl;
  ButtonPressEvent({@required this.index, @required this.imageUrl})
      : assert(index != null),
        assert(imageUrl != null);
}
