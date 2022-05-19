import 'package:appito/_all.dart';

abstract class AppNavigationEvent {}

class AppNavigationCompleteStepEvent extends AppNavigationEvent {
  final AppNavigationStateStatus status;

  AppNavigationCompleteStepEvent({required this.status});
}

class AppNavigationRevertStepEvent extends AppNavigationEvent {
  final AppNavigationStateStatus status;

  AppNavigationRevertStepEvent({required this.status});
}
