
import '../_all.dart';

class CakePage extends StatelessWidget {
  const CakePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter challange"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => FirstPage()));
          },
          child: const Text(
            "Otvori aplikaciju",
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
