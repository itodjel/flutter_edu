import 'package:flutter/material.dart';

import 'mybody.dart';

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
