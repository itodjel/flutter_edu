import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malomalo/blocs/all.dart';
import 'package:malomalo/counter.dart';

import 'adresslocation.dart';
import 'buttons.dart';
import 'imagedisplay.dart';
import 'ingredients.dart';

class SayHello extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ButtonBloc(),
      child: SafeArea(
        child: Container(
          //padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  child: Center(
                child: Text(
                  "Fruits Cake",
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              )),
              Container(
                  margin: EdgeInsets.only(top: 15.0),
                  child: Center(
                    child: Text(
                      "strawberry & kiwi special",
                      style: TextStyle(
                          color: Color.fromRGBO(97, 93, 41, 1), fontSize: 15),
                      textAlign: TextAlign.center,
                    ),
                  )),
              Buttons(),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [ImageDisplay(), CounterInfo()],
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Container(
                  margin: EdgeInsets.only(right: 10),
                  color: Color.fromRGBO(47, 47, 79, 1),
                  child: Text(
                    "\$84.99",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                    textAlign: TextAlign.right,
                  ),
                ),
              ),
              Ingredients(),
              AdressLocation()
            ],
          ),
        ),
      ),
    );
  }
}
