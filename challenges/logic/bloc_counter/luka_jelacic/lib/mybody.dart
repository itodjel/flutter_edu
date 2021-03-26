import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:luka_jelacic/blocs/counter_bloc.dart';
import 'package:luka_jelacic/blocs/counter_event.dart';
import 'package:luka_jelacic/blocs/counter_state.dart';

class MyBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CounterBloc, CounterState>(
      listenWhen: (previous, current) {
        return previous.counter != current.counter;
      },
      listener: (context, state) {
        if (state.stateStatus == CounterStateStatus.SuccessfullyUpdated) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('updated!!'),
          ));
        }
      },
      builder: (context, state) {
        return Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: FloatingActionButton(
                    onPressed: () => context
                        .read<CounterBloc>()
                        .add(IncrementCounterEvent()),
                    child: Icon(Icons.add),
                  ),
                ),
                state.stateStatus == CounterStateStatus.Loaded
                    ? CircleAvatar(
                        child: Text('${state.counter}'),
                      )
                    : CircularProgressIndicator(),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: FloatingActionButton(
                    onPressed: () => context
                        .read<CounterBloc>()
                        .add(DecrementCounterEvent()),
                    child: Icon(Icons.remove),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

class LoadingAnimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(color: Colors.blue),
          child: Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.red,
            ),
          ),
        )
      ],
    );
  }
}
