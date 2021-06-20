abstract class NavigationEvent {}

class ChangePageNavigationEvent extends NavigationEvent {
  final int index;

  ChangePageNavigationEvent({
    required this.index,
  });
}
