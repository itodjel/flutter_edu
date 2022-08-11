import '../../_all.dart';

class RadioButton extends StatefulWidget {
  const RadioButton({
    Key? key,
  }) : super(key: key);

  @override
  State<RadioButton> createState() => _RadioButtonState();
}

class _RadioButtonState extends State<RadioButton> {
   int? _selectedValueIndex = 0;
  List<String> buttonText = ["1 kg", "2 kg", "3 kg", "4 kg"];

  Widget button({required String text, required int index}) {
    return InkWell(
      splashColor: primarna,
      onTap: () {
        setState(() {
          _selectedValueIndex = index;
        });
      },

      child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            width: 80,
            height: 30,
            color: index == _selectedValueIndex ? textZuta : primarna,
            child: Center(
              child: Text(
                text,
                style: TextStyle(fontSize: 18, color: index == _selectedValueIndex ? textBijela : textZuta),
              ),
            ),
          ),
        ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...List.generate(
          buttonText.length,
          (index) => button(
            index: index,
            text: buttonText[index],
          ),
        )
      ],
    );
  }
}
