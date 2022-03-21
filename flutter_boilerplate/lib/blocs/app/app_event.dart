import 'package:flutter_boilerplate/_all.dart';

abstract class AppEvent {}

class AppCompleteStepEvent extends AppEvent {
  final AppRequirement requirement;

  AppCompleteStepEvent({required this.requirement});
}
