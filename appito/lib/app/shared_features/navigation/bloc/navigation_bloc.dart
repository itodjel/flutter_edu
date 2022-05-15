import 'package:appito/_all.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(NavigationState(index: 0)) {
    on<NavigationChangeIndexEvent>(_changeIndex);
  }

  Future<void> _changeIndex(NavigationChangeIndexEvent event, Emitter<NavigationState> emit) async {
    emit(NavigationState(index: event.index, subIndex: event.subIndex));
  }
}
