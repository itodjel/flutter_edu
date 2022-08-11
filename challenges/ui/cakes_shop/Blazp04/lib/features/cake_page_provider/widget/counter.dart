import 'package:blazp04/features/cake_page_provider/providers/counterProvider.dart';

import '../../_all.dart';

class Counter extends StatelessWidget {
  const Counter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<CounterProvider>(context, listen: false);
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          GestureDetector(
            onTap: (() => counter.povecaj()),
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
                child: Consumer<CounterProvider>(
                  builder: (context, kolicinaProvider, child) {
                    return Text(
                      kolicinaProvider.kolicina.toString(),
                      style: TextStyle(fontSize: 30, color: textBijela),
                    );
                  },
                ),
              ),
            ),
          ),
          GestureDetector(
        onTap: (() => counter.smanji()),
            child: Text(
              "-",
              style: TextStyle(fontSize: 30, color: textBijela),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Consumer<CounterProvider>(
              builder: (context, kolicinaProvider, child) {
                return Text(
                  (kolicinaProvider.kolicina * 84).toString() + " €",
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
