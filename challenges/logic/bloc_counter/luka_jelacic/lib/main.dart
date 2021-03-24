import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "blocLogic",
      home: MyScaffold(),
    );
  }
}

class MyScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.arrow_back_ios_outlined),
          title: Text("Bloc Logic"),
          actions: [IconButton(icon: Icon(Icons.favorite), onPressed: () {})],
        ),
        body: MyBody(),
      ),
    );
  }
}

class MyBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10),
            child: FloatingActionButton(
              onPressed: () {},
              child: Icon(Icons.add),
            ),
          ),
          CircleAvatar(
            child: Text("0"),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: FloatingActionButton(
              onPressed: () {},
              child: Icon(Icons.remove),
            ),
          )
        ],
      ),
    ));
  }
}
