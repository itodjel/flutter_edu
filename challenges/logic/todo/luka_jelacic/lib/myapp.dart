import 'package:flutter/material.dart';

import 'mybody.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "todo",
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black,
          body: MyBody(),
        ),
      ),
    );
  }
}
