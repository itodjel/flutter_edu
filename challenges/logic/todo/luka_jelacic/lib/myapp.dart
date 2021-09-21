import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:luka_jelacic/blocs/todo_bloc.dart';

import 'mybody.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "todo",
        home: BlocProvider(
          create: (context) => TodoBloc(),
          child: SafeArea(
            child: Scaffold(
              backgroundColor: Colors.black,
              body: MyBody(),
            ),
          ),
        ));
  }
}
