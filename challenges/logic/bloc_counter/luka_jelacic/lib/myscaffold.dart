import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:luka_jelacic/blocs/counter_bloc.dart';

import 'mybody.dart';

class MyScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: Icon(Icons.arrow_back_ios_outlined),
            title: Text("Bloc Logic"),
            actions: [IconButton(icon: Icon(Icons.favorite), onPressed: () {})],
          ),
          body: MyBody(),
        ),
      ),
    );
  }
}
