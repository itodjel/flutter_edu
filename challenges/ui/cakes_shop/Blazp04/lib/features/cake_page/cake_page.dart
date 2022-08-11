
import '../_all.dart';

class CakePage extends StatelessWidget {
  const CakePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primarna,
      appBar: AppBar(
        title: Text("Flutter challange"),
        backgroundColor: primarna,
      ),
      body: Container(
        child: ListView(
          // ignore: prefer_const_literals_to_create_immutables
          children: <Widget>[
            SizedBox(height: 20),
            Center(
              child: Text(
                "Fruits cake",
                style: TextStyle(fontSize: 30, color: textBijela),
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: Text(
                "makli kolac od nekakve cokolade",
                style: TextStyle(fontSize: 18, color: textZuta),
              ),
            ),
            SizedBox(height: 30),
            RadioButton(),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 200,
                  child: Image.asset("assets/kolac1.png", fit: BoxFit.contain),
                ),
                SizedBox(width: 40),
                Counter(),
              ],
            ),
            SizedBox(height: 40),
            Sastojci()
          ],
        ),
      ),
    );
  }
}

