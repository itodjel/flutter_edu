import 'package:blazp04/features/_all.dart';

void main() {
  runApp(const MyApp());
}

// By Blaž Perić 10.8.2022 - Mostar
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CounterProvider>(create: (context) => CounterProvider()),
        BlocProvider(
          create: (context) => CounterBloc(),
        )
      ],
      child: MaterialApp(
        title: 'Ito challange',
        debugShowCheckedModeBanner: false,
        home: FirstPage(),
      ),
    );
  }
}
