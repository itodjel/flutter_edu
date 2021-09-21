import 'package:flutter_boilerplate/blocs/app/all.dart';

abstract class AppEvent {}

class AppCompleteStepEvent extends AppEvent {
  final AppRequirement requirement;

  AppCompleteStepEvent({required this.requirement});
}
