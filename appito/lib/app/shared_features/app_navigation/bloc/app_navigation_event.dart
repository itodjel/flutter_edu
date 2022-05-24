import 'package:appito/_all.dart';

abstract class AppNavigationEvent {}

class AppNavigationCompleteStepEvent extends AppNavigationEvent {
  final AppNavigationStep step;

  AppNavigationCompleteStepEvent({required this.step});
}

class AppNavigationRevertStepEvent extends AppNavigationEvent {
  final AppNavigationStep step;

  AppNavigationRevertStepEvent({required this.step});
}
