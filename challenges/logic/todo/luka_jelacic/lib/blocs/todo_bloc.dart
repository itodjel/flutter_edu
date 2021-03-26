import 'package:luka_jelacic/blocs/todo_event.dart';
import 'package:luka_jelacic/blocs/todo_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:luka_jelacic/todoItem.dart';
import 'package:uuid/uuid.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc()
      : super(TodoState(todoStatus: TodoStateStatus.InitialState, todos: []));

  @override
  Stream<TodoState> mapEventToState(TodoEvent event) async* {
    if (event is AddNewTodoEvent) {
      yield* addNewTodo(event);
    } else if (event is DeleteItemEvent) {
      yield* deleteItem(event);
    }
  }

  Stream<TodoState> addNewTodo(AddNewTodoEvent event) async* {
    var uuid = Uuid();
    String id = uuid.v1();
    TodoItem todo = TodoItem(id, event.text, false);
    for (var i = 0; i < state.todos.length; i++) {
      if (state.todos[i].text == todo.text) {
        yield state.copyWith(
            todoStatus: TodoStateStatus.DuplicateItemState, todos: state.todos);
        return;
      }
    }
    state.todos.add(todo);
    yield state.copyWith(
        todoStatus: TodoStateStatus.NewItemState, todos: state.todos);
  }

  Stream<TodoState> deleteItem(DeleteItemEvent event) async* {
    var item = state.todos.where((x) => x.id == event.id).single;
    state.todos.remove(item);
    yield state.copyWith(
        todoStatus: TodoStateStatus.DeleteItemState, todos: state.todos);
  }
}
