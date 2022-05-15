abstract class NavigationEvent {}

class NavigationChangeIndexEvent extends NavigationEvent {
  final int index;
  final int subIndex;

  NavigationChangeIndexEvent({
    this.index = 0,
    this.subIndex = 0,
  });
}
