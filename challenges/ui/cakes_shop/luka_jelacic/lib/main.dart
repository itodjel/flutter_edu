import 'package:flutter/material.dart';
import 'package:malomalo/sayhello.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "New app",
        home: Scaffold(
          backgroundColor: Color.fromRGBO(47, 47, 79, 1),
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Color.fromRGBO(47, 47, 79, 1),
            leading: Icon(Icons.arrow_back_ios),
            //title: Text("New app"),
            actions: [
              Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: Icon(Icons.favorite),
              )
            ],
          ),
          body: SayHello(),
        ));
  }
}
