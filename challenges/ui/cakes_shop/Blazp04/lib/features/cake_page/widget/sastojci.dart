import '../../_all.dart';

class Sastojci extends StatelessWidget {
  const Sastojci({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          width: 350,
          height: 150,
          color: dugme,
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset("assets/jaje.png"),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "2 Eggs",
                      style: TextStyle(fontSize: 20, color: textBijela),
                    )
                  ],
                ),
              ),
              Container(
                width: 2,
                color: spacer,
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset("assets/vanilija.png"),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "2 tsp vanilla",
                      style: TextStyle(fontSize: 20, color: textBijela),
                    )
                  ],
                ),
              ),
              Container(
                width: 2,
                color: spacer,
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset("assets/secer.png"),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "1 cup sugar",
                      style: TextStyle(fontSize: 20, color: textBijela),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
