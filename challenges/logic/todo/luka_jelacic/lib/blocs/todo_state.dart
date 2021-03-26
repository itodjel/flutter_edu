import 'package:luka_jelacic/todoItem.dart';

enum TodoStateStatus {
  InitialState,
  NewItemState,
  DeleteItemState,
  DuplicateItemState
}

class TodoState {
  TodoStateStatus todoStatus;
  List<TodoItem> todos;
  TodoState({this.todoStatus, this.todos});

  TodoState copyWith({TodoStateStatus todoStatus, List<TodoItem> todos}) =>
      TodoState(
          todoStatus: todoStatus ?? this.todoStatus,
          todos: todos ?? this.todos);
}
