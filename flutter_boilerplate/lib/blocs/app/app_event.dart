import 'package:flutter_boilerplate/blocs/app/_all.dart';

abstract class AppEvent {}

class AppCompleteStepEvent extends AppEvent {
  final AppRequirement requirement;

  AppCompleteStepEvent({required this.requirement});
}
