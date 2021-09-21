import 'package:flutter/cupertino.dart';

abstract class TodoEvent {}

class AddNewTodoEvent extends TodoEvent {
  String text;
  AddNewTodoEvent({@required this.text}) : assert(text != null);
}

class DeleteItemEvent extends TodoEvent {
  String id;
  DeleteItemEvent({@required this.id}) : assert(id != null);
}
