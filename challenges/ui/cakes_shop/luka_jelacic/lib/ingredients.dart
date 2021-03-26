import 'package:flutter/material.dart';

class Ingredients extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 10),
          padding: EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
          decoration: BoxDecoration(
              color: Color.fromRGBO(33, 33, 41, 1),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10))),
          child: Column(
            children: [
              Icon(
                Icons.favorite,
                size: 70,
                color: Color.fromRGBO(59, 59, 66, 1),
              ),
              Text(
                "4 eggs",
                style: TextStyle(color: Color.fromRGBO(59, 59, 66, 1)),
              )
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
          margin: EdgeInsets.only(left: 1, right: 1, top: 10, bottom: 0),
          //margin: EdgeInsets.symmetric(horizontal: 1, vertical: 0),
          decoration: BoxDecoration(
            color: Color.fromRGBO(33, 33, 41, 1),
          ),
          child: Column(
            children: [
              Icon(
                Icons.free_breakfast,
                size: 70,
                color: Color.fromRGBO(59, 59, 66, 1),
              ),
              Text(
                "2 tsp vanilla",
                style: TextStyle(color: Color.fromRGBO(59, 59, 66, 1)),
              )
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 10),
          padding: EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
          decoration: BoxDecoration(
              color: Color.fromRGBO(33, 33, 41, 1),
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10))),
          child: Column(
            children: [
              Icon(
                Icons.hardware,
                size: 70,
                color: Color.fromRGBO(59, 59, 66, 1),
              ),
              Text(
                "1 cup sugar",
                style: TextStyle(color: Color.fromRGBO(59, 59, 66, 1)),
              )
            ],
          ),
        )
      ],
    );
  }
}
