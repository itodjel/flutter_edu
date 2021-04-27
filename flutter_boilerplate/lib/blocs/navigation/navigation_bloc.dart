import 'dart:async';
import 'package:bloc/bloc.dart';
import 'all.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(NavigationState(index: 0));

  @override
  Stream<NavigationState> mapEventToState(NavigationEvent event) async* {
    if (event is ChangePageNavigationEvent) {
      yield* _change(event);
    }
  }

  Stream<NavigationState> _change(ChangePageNavigationEvent event) async* {
    yield NavigationState(index: event.index);
  }
}
