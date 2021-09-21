import 'package:flutter_boilerplate/_all.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(NavigationState(index: 0));

  @override
  Stream<NavigationState> mapEventToState(NavigationEvent event) async* {
    if (event is NavigationChangeIndexEvent) {
      yield* _change(event);
    }
  }

  Stream<NavigationState> _change(NavigationChangeIndexEvent event) async* {
    yield NavigationState(index: event.index, subIndex: event.subIndex);
  }
}
