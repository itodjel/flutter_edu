import 'package:meta/meta.dart';

abstract class TabsEvent {}

class TabsChangeEvent extends TabsEvent {
  final int index;
  TabsChangeEvent({@required this.index}) : assert(index != null);
}
