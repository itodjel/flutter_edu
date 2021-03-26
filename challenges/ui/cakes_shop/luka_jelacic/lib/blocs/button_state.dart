import 'package:malomalo/blocs/all.dart';

abstract class ButtonState {
  final int index;
  final String imageUrl;
  ButtonState({this.index = 0, this.imageUrl = "images/cake.png"});
}

class ButtonPressState extends ButtonState {
  final int index;
  final String imageUrl;
  ButtonPressState({this.index = 0, this.imageUrl = "images/cake.png"});
}

class LoadingState extends ButtonState {}
