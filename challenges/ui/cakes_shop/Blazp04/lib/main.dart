import 'package:blazp04/features/cake_page/bloc/counter_bloc/counter_bloc.dart';
import 'package:blazp04/features/cake_page/cake_page.dart';
import 'package:blazp04/features/first_page/first_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}
// By Blaž Perić 10.8.2022 - Mostar
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CounterBloc(),
        )
      ],
      child: MaterialApp(
        title: 'Ito challange',
         debugShowCheckedModeBanner: false,
        home:  FirstPage(),
      ),
    );
  }
}


