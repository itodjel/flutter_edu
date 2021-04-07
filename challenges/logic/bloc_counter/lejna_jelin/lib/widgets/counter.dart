import 'package:bloc_counter/blocs/counter/all.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Counter extends StatefulWidget {
  Counter({Key key}) : super(key: key);

  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => CounterBloc(),
        child: Container(child: Center(
          child: BlocBuilder<CounterBloc, CounterState>(
              builder: (context, counterState) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.add,
                      size: 30.0,
                      color: counterState.status == CounterStateStatus.loaded
                          ? Colors.white
                          : Colors.grey),
                  onPressed: () =>
                      counterState.status == CounterStateStatus.loaded
                          ? context.read<CounterBloc>().add(IncrementEvent())
                          : {},
                ),
                Stack(
                  children: [
                    Container(
                        child: Align(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 10.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Opacity(
                            opacity:
                                counterState.status == CounterStateStatus.loaded
                                    ? 1
                                    : 0.3,
                            child: Text(
                              '${counterState.counter}',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                              ),
                            )),
                      ),
                    )),
                    Container(
                        child: Align(
                            child: Opacity(
                                opacity: counterState.status ==
                                        CounterStateStatus.loaded
                                    ? 0
                                    : 0.9,
                                child: CircularProgressIndicator())))
                  ],
                ),
                IconButton(
                  icon: Icon(Icons.remove,
                      size: 30.0,
                      color: counterState.status == CounterStateStatus.loaded
                          ? Colors.white
                          : Colors.grey),
                  onPressed: () =>
                      counterState.status == CounterStateStatus.loaded
                          ? context.read<CounterBloc>().add(DecrementEvent())
                          : {},
                ),
              ],
            );
          }),
        )));
  }
}
