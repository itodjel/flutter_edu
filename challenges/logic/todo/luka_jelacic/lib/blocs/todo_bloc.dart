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
    }
  }

  Stream<TodoState> addNewTodo(AddNewTodoEvent event) async* {
    var uuid = Uuid();
    String id = uuid.v1();
    TodoItem todo = TodoItem(id, event.text, false);
    state.todos.add(todo);
    yield state.copyWith(
        todoStatus: TodoStateStatus.NewItemState, todos: state.todos);
    // yield TodoState(
    //     todoStatus: TodoStateStatus.NewItemState, todos: state.todos);
  }
}
