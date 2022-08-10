import '../../_all.dart';

class RadioButton extends StatelessWidget {
  const RadioButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            width: 80,
            height: 30,
            color: Colors.white,
            child: Center(
              child: Text(
                "1 kg",
                style: TextStyle(fontSize: 18, color: textZuta),
              ),
            ),
          ),
        ),
        SizedBox(width: 10),
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            width: 80,
            height: 30,
            color: Colors.white,
            child: Center(
              child: Text(
                "1 kg",
                style: TextStyle(fontSize: 18, color: textZuta),
              ),
            ),
          ),
        ),
        SizedBox(width: 10),
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            width: 80,
            height: 30,
            color: Colors.white,
            child: Center(
              child: Text(
                "1 kg",
                style: TextStyle(fontSize: 18, color: textZuta),
              ),
            ),
          ),
        ),
        SizedBox(width: 10),
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            width: 80,
            height: 30,
            color: Colors.white,
            child: Center(
              child: Text(
                "1 kg",
                style: TextStyle(fontSize: 18, color: textZuta),
              ),
            ),
          ),
        ),
        SizedBox(width: 10),
      ],
    );
  }
}
