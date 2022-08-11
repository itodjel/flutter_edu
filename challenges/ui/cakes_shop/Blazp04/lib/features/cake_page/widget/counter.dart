import '../../_all.dart';

class Counter extends StatelessWidget {
  const Counter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          GestureDetector(
            onTap: (() => context.read<CounterBloc>().add(PovecajEvent())),
            child: Text(
              "+",
              style: TextStyle(fontSize: 30, color: textBijela),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(200000),
            child: Container(
              color: textZuta,
              width: 40,
              height: 40,
              child: Center(
                child: BlocBuilder<CounterBloc, CounterState>(
                  builder: (context, state) {
                    return Text(
                      state.kolicina.toString(),
                      style: TextStyle(fontSize: 30, color: textBijela),
                    );
                  },
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: (() => context.read<CounterBloc>().add(SmanjiEvent())),
            child: Text(
              "-",
              style: TextStyle(fontSize: 30, color: textBijela),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) {
                return Text(
                 ( state.kolicina * 84).toString() + " €",
                  style: TextStyle(fontSize: 30, color: textBijela),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
