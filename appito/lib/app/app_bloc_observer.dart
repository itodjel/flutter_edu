import 'dart:developer';

import 'package:appito/_all.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);

    final blocName = _clean(bloc.runtimeType);
    final oldStateStatus = _clean(_stateStatus(transition.currentState));
    final eventName = _clean(transition.event);
    final newStateStatus = _clean(_stateStatus(transition.nextState));

    log('Bloc transition: [$blocName] $oldStateStatus -> $eventName -> $newStateStatus');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    final blocName = _clean(bloc.runtimeType);

    log('Bloc error: [$blocName] $error, $stackTrace)');

    super.onError(bloc, error, stackTrace);
  }

  String _clean(dynamic text) => text.toString().replaceAll('\'', '').replaceAll('Instance of ', '');

  String _stateStatus(dynamic state) {
    try {
      return state.status.toString().split('.')[1];
    } catch (e) {
      try {
        return state.resultStatus.toString().split('.')[1];
      } catch (e) {
        return state.runtimeType.toString();
      }
    }
  }
}
