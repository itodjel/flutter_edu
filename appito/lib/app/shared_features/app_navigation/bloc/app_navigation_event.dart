import 'package:appito/_all.dart';

abstract class AppNavigationEvent {}

class AppNavigationCompleteStepEvent extends AppNavigationEvent {
  final AppNavigationStateStatus status;

  AppNavigationCompleteStepEvent({required this.status});
}
