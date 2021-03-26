import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:luka_jelacic/blocs/todo_event.dart';
import 'package:luka_jelacic/blocs/todo_state.dart';

import 'blocs/todo_bloc.dart';

class MyBody extends StatefulWidget {
  @override
  _MyBodyState createState() => _MyBodyState();
}

class _MyBodyState extends State<MyBody> {
  TextEditingController todo = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TodoBloc, TodoState>(
      listener: (context, state) {
        if (state.todoStatus == TodoStateStatus.NewItemState) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Uspjesno dodan'),
          ));
          todo.text = '';
        }
        if (state.todoStatus == TodoStateStatus.DeleteItemState) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Uspjesno izbrisan'),
          ));
        }
        if (state.todoStatus == TodoStateStatus.DuplicateItemState) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Vec postoji.'),
          ));
        }
      },
      builder: (context, state) {
        return Container(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(30),
                child: Text(
                  '${state.todos.length} remaining',
                  textAlign: TextAlign.left,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: state.todos.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.all(10),
                      child: ListTile(
                        tileColor: Color.fromRGBO(32, 32, 32, 1),
                        title: Text(state.todos[index].text,
                            style: TextStyle(color: Colors.white)),
                        trailing: IconButton(
                          icon: Icon(
                            Icons.delete,
                            color: Colors.white,
                          ),
                          onPressed: () => context
                              .read<TodoBloc>()
                              .add(DeleteItemEvent(id: state.todos[index].id)),
                        ),
                      ),
                    );
                  },
                ),
              )
              //     child: ListView(
              //   children: [
              //     Container(
              //       margin: EdgeInsets.all(10),
              //       child: ListTile(
              //         tileColor: Color.fromRGBO(32, 32, 32, 1),
              //         title: Text(
              //           "Gospodar prstenova",
              //           style: TextStyle(color: Colors.white),
              //         ),
              //         subtitle: Text("Druzina prstena",
              //             style: TextStyle(color: Colors.white)),
              //         trailing: Icon(
              //           Icons.delete,
              //           color: Colors.white,
              //         ),
              //       ),
              //     ),
              //     Container(
              //       margin: EdgeInsets.all(10),
              //       child: ListTile(
              //         tileColor: Color.fromRGBO(32, 32, 32, 1),
              //         title: Text(
              //           "Gospodar prstenova",
              //           style: TextStyle(color: Colors.white),
              //         ),
              //         subtitle: Text("Dvije kule",
              //             style: TextStyle(color: Colors.white)),
              //         trailing: Icon(
              //           Icons.delete,
              //           color: Colors.white,
              //         ),
              //       ),
              //     ),
              //     Container(
              //       margin: EdgeInsets.all(10),
              //       child: ListTile(
              //         tileColor: Color.fromRGBO(32, 32, 32, 1),
              //         title: Text(
              //           "Gospodar prstenova",
              //           style: TextStyle(color: Colors.white),
              //         ),
              //         subtitle: Text("Povratak kralja",
              //             style: TextStyle(color: Colors.white)),
              //         trailing: Icon(
              //           Icons.delete,
              //           color: Colors.white,
              //         ),
              //       ),
              //     )
              //   ],
              // )),
              ,
              Row(
                children: [
                  Expanded(
                    child: Container(
                        margin: EdgeInsets.all(10),
                        child: TextField(
                          controller: todo,
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: "Buy milk",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10))),
                        )),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: FloatingActionButton(
                      onPressed: () => context
                          .read<TodoBloc>()
                          .add(AddNewTodoEvent(text: todo.text)),
                      child: Icon(
                        Icons.add,
                        color: Colors.black,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
