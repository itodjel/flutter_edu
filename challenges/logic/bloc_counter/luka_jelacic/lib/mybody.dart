import 'package:flutter/material.dart';

class MyBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10),
            child: FloatingActionButton(
              onPressed: () {},
              child: Icon(Icons.add),
            ),
          ),
          CircleAvatar(
            child: Text("0"),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: FloatingActionButton(
              onPressed: () {},
              child: Icon(Icons.remove),
            ),
          )
        ],
      ),
    ));
  }
}
