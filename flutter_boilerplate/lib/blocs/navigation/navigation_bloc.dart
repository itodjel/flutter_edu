import 'package:flutter_boilerplate/_all.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(initialState()) {
    on<NavigationChangeIndexEvent>(_changeIndex);
  }

  static NavigationState initialState() => NavigationState(index: 0);

  Future<void> _changeIndex(NavigationChangeIndexEvent event, Emitter<NavigationState> emit) async {
    emit(NavigationState(index: event.index, subIndex: event.subIndex));
  }
}
