import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malomalo/blocs/button_event.dart';
import 'package:malomalo/blocs/button_state.dart';

class ButtonBloc extends Bloc<ButtonEvent, ButtonState> {
  ButtonBloc() : super(ButtonState(index: 0, imageUrl: "images/cake.png"));

  @override
  Stream<ButtonState> mapEventToState(ButtonEvent event) async* {
    if (event is ButtonPressEvent) {
      yield* _change(event);
    }
  }

  Stream<ButtonState> _change(ButtonPressEvent event) async* {
    yield ButtonState(index: event.index, imageUrl: event.imageUrl);
  }
}
