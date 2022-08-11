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
          Text(
            "+",
            style: TextStyle(fontSize: 30, color: textBijela),
          ),
          ClipRRect(
              borderRadius: BorderRadius.circular(200000),
            child: Container(
              color: textZuta,
              width: 40,height: 40,
              child: Center(child: Text("0", style: TextStyle(fontSize: 30, color: textBijela))),
            ),
          ),
          Text(
            "-",
            style: TextStyle(fontSize: 30, color: textBijela),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text(
              "40€",
              style: TextStyle(fontSize: 30, color: textBijela),
            ),
          ),
        ],
      ),
    );
  }
}
