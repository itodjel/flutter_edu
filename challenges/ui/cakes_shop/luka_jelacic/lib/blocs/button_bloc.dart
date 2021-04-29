import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malomalo/blocs/button_event.dart';
import 'package:malomalo/blocs/button_state.dart';

class ButtonBloc extends Bloc<ButtonEvent, ButtonState> {
  ButtonBloc() : super(ButtonPressState(index: 0, imageUrl: "images/cake.png"));

  @override
  Stream<ButtonState> mapEventToState(ButtonEvent event) async* {
    if (event is ButtonPressEvent) {
      yield* _change(event);
    }
  }

  Stream<ButtonState> _change(ButtonPressEvent event) async* {
    yield LoadingState();
    await Future.delayed(Duration(seconds: 1));
    String urlImage = getUrl(event.index);
    yield ButtonPressState(index: event.index, imageUrl: urlImage);
  }

  String getUrl(int index) {
    String url;
    switch (index) {
      case 0:
        url = "images/cake.png";
        break;
      case 1:
        url = "images/final.png";
        break;
      case 2:
        url = "images/torta.png";
        break;
      case 3:
        url = "images/cake.png";
        break;
    }
    return url;
  }
}
