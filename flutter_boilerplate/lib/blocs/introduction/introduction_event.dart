abstract class IntroductionEvent {}

class IntroductionChangeIndexEvent extends IntroductionEvent {
  int index;
  IntroductionChangeIndexEvent({required this.index});
}

class IntroductionInitEvent extends IntroductionEvent {}

class IntroductionSetIntroSeenEvent extends IntroductionEvent {}
