import 'package:blazp04/features/cake_page/cake_page.dart';
import 'package:blazp04/features/first_page/first_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
// By Blaž Perić 10.8.2022 - Mostar
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ito challange',
      home:  CakePage(),
    );
  }
}


