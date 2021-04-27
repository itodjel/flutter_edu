abstract class AppEvent {
  const AppEvent();
}

class AppCompleteStepEvent extends AppEvent {}

class AppSetupEvent extends AppEvent {}
