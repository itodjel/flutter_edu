
import '../_all.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter challange"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => CakePage  ()));
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
