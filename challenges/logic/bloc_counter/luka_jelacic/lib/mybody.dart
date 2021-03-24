import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:luka_jelacic/blocs/counter_bloc.dart';
import 'package:luka_jelacic/blocs/counter_event.dart';
import 'package:luka_jelacic/blocs/counter_state.dart';

class MyBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterBloc, CounterState>(
      builder: (context, state) {
        if (state is LoadingState) {
          return Container(
              child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: FloatingActionButton(
                    onPressed: null
                    /*() {} => context
                        .read<CounterBloc>()
                        .add(IncrementCounterEvent(counter: state.counter)),*/
                    ,
                    child: Icon(Icons.add),
                  ),
                ),
                CircleAvatar(
                  child: Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.red,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: FloatingActionButton(
                    onPressed: null
                    /*() {} => context
                        .read<CounterBloc>()
                        .add(DecrementCounterEvent(counter: state.counter)),*/
                    ,
                    child: Icon(Icons.remove),
                  ),
                )
              ],
            ),
          ));
        } else {
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
                        .add(IncrementCounterEvent(counter: state.counter)),
                    child: Icon(Icons.add),
                  ),
                ),
                CircleAvatar(
                  child: Text('${state.counter}'),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: FloatingActionButton(
                    onPressed: () => context
                        .read<CounterBloc>()
                        .add(DecrementCounterEvent(counter: state.counter)),
                    child: Icon(Icons.remove),
                  ),
                )
              ],
            ),
          ));
        }
      },
    );
  }
}

class LoadingAnimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: CircularProgressIndicator(
          backgroundColor: Colors.red,
        ),
      ),
    );
  }
}
