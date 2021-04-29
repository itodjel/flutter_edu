import 'package:flutter/material.dart';

class CounterInfo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CounterState();
}

class _CounterState extends State<CounterInfo> {
  int counter = 0;
  void increment() {
    setState(() {
      counter++;
    });
  }

  void decrement() {
    setState(() {
      counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 50,
      //margin: EdgeInsets.only(left: 10),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10),
            child: TextButton(
                onPressed: increment,
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                )),
          ),
          Container(
            child: CircleAvatar(
              backgroundColor: Color.fromRGBO(97, 93, 41, 1),
              child: Text(
                '${counter.toString()}',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: TextButton(
                onPressed: decrement,
                child: Icon(
                  Icons.remove,
                  color: Colors.white,
                )),
          )
        ],
      ),
    );
  }
}
