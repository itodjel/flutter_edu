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
            content: Text('Added new item in todo list!!'),
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
                  "2 remaining",
                  textAlign: TextAlign.left,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              Expanded(
                  child: ListView(
                children: [
                  Container(
                    margin: EdgeInsets.all(10),
                    child: ListTile(
                      tileColor: Color.fromRGBO(32, 32, 32, 1),
                      title: Text(
                        "Gospodar prstenova",
                        style: TextStyle(color: Colors.white),
                      ),
                      subtitle: Text("Druzina prstena",
                          style: TextStyle(color: Colors.white)),
                      trailing: Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: ListTile(
                      tileColor: Color.fromRGBO(32, 32, 32, 1),
                      title: Text(
                        "Gospodar prstenova",
                        style: TextStyle(color: Colors.white),
                      ),
                      subtitle: Text("Dvije kule",
                          style: TextStyle(color: Colors.white)),
                      trailing: Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: ListTile(
                      tileColor: Color.fromRGBO(32, 32, 32, 1),
                      title: Text(
                        "Gospodar prstenova",
                        style: TextStyle(color: Colors.white),
                      ),
                      subtitle: Text("Povratak kralja",
                          style: TextStyle(color: Colors.white)),
                      trailing: Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              )),
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
    return BlocBuilder<TodoBloc, TodoState>(
      builder: (context, state) {
        return Container(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(30),
                child: Text(
                  "2 remaining",
                  textAlign: TextAlign.left,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              Expanded(
                  child: ListView(
                children: [
                  Container(
                    margin: EdgeInsets.all(10),
                    child: ListTile(
                      tileColor: Color.fromRGBO(32, 32, 32, 1),
                      title: Text(
                        "Gospodar prstenova",
                        style: TextStyle(color: Colors.white),
                      ),
                      subtitle: Text("Druzina prstena",
                          style: TextStyle(color: Colors.white)),
                      trailing: Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: ListTile(
                      tileColor: Color.fromRGBO(32, 32, 32, 1),
                      title: Text(
                        "Gospodar prstenova",
                        style: TextStyle(color: Colors.white),
                      ),
                      subtitle: Text("Dvije kule",
                          style: TextStyle(color: Colors.white)),
                      trailing: Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: ListTile(
                      tileColor: Color.fromRGBO(32, 32, 32, 1),
                      title: Text(
                        "Gospodar prstenova",
                        style: TextStyle(color: Colors.white),
                      ),
                      subtitle: Text("Povratak kralja",
                          style: TextStyle(color: Colors.white)),
                      trailing: Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              )),
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

// class MyBody extends StatelessWidget {
//   TextEditingController todo = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<TodoBloc, TodoState>(
//       builder: (context, state) {
//         return Container(
//           child: Column(
//             children: [
//               Container(
//                 padding: EdgeInsets.all(30),
//                 child: Text(
//                   "2 remaining",
//                   textAlign: TextAlign.left,
//                   style: TextStyle(color: Colors.white, fontSize: 20),
//                 ),
//               ),
//               Expanded(
//                   child: ListView(
//                 children: [
//                   Container(
//                     margin: EdgeInsets.all(10),
//                     child: ListTile(
//                       tileColor: Color.fromRGBO(32, 32, 32, 1),
//                       title: Text(
//                         "Gospodar prstenova",
//                         style: TextStyle(color: Colors.white),
//                       ),
//                       subtitle: Text("Druzina prstena",
//                           style: TextStyle(color: Colors.white)),
//                       leading: Icon(
//                         Icons.ring_volume,
//                         color: Colors.white,
//                       ),
//                       trailing: Icon(
//                         Icons.delete,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                   Container(
//                     margin: EdgeInsets.all(10),
//                     child: ListTile(
//                       tileColor: Color.fromRGBO(32, 32, 32, 1),
//                       title: Text(
//                         "Gospodar prstenova",
//                         style: TextStyle(color: Colors.white),
//                       ),
//                       subtitle: Text("Dvije kule",
//                           style: TextStyle(color: Colors.white)),
//                       leading: Icon(
//                         Icons.ring_volume,
//                         color: Colors.white,
//                       ),
//                       trailing: Icon(
//                         Icons.delete,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                   Container(
//                     margin: EdgeInsets.all(10),
//                     child: ListTile(
//                       tileColor: Color.fromRGBO(32, 32, 32, 1),
//                       title: Text(
//                         "Gospodar prstenova",
//                         style: TextStyle(color: Colors.white),
//                       ),
//                       subtitle: Text("Povratak kralja",
//                           style: TextStyle(color: Colors.white)),
//                       leading: Icon(
//                         Icons.ring_volume,
//                         color: Colors.white,
//                       ),
//                       trailing: Icon(
//                         Icons.delete,
//                         color: Colors.white,
//                       ),
//                     ),
//                   )
//                 ],
//               )),
//               Row(
//                 children: [
//                   Expanded(
//                     child: Container(
//                         margin: EdgeInsets.all(10),
//                         child: TextField(
//                           controller: todo,
//                           decoration: InputDecoration(
//                               filled: true,
//                               fillColor: Colors.white,
//                               hintText: "Buy milk",
//                               border: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(10))),
//                         )),
//                   ),
//                   Container(
//                     margin: EdgeInsets.all(10),
//                     child: FloatingActionButton(
//                       onPressed: () {},
//                       child: Icon(
//                         Icons.add,
//                         color: Colors.black,
//                       ),
//                     ),
//                   )
//                 ],
//               )
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
