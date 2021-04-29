import 'package:flutter/material.dart';

import 'myscaffold.dart';

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
