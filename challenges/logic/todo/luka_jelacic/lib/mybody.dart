import 'dart:html';

import 'package:flutter/material.dart';

class MyBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(30),
            child: Text(
              "2 remaining",
              textAlign: TextAlign.left,
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              Container(
                margin: EdgeInsets.all(10),
                child: ListTile(
                  tileColor: Color.fromRGBO(32, 32, 32, 1),
                  title: Text(
                    "Gospodar prstenova",
                    style: TextStyle(color: Colors.white),
                  ),
                  subtitle: Text("Druzina prstena",
                      style: TextStyle(color: Colors.white)),
                  leading: Icon(
                    Icons.ring_volume,
                    color: Colors.white,
                  ),
                  trailing: Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: ListTile(
                  tileColor: Color.fromRGBO(32, 32, 32, 1),
                  title: Text(
                    "Gospodar prstenova",
                    style: TextStyle(color: Colors.white),
                  ),
                  subtitle:
                      Text("Dvije kule", style: TextStyle(color: Colors.white)),
                  leading: Icon(
                    Icons.ring_volume,
                    color: Colors.white,
                  ),
                  trailing: Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: ListTile(
                  tileColor: Color.fromRGBO(32, 32, 32, 1),
                  title: Text(
                    "Gospodar prstenova",
                    style: TextStyle(color: Colors.white),
                  ),
                  subtitle: Text("Povratak kralja",
                      style: TextStyle(color: Colors.white)),
                  leading: Icon(
                    Icons.ring_volume,
                    color: Colors.white,
                  ),
                  trailing: Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          )),
          Row(
            children: [
              Expanded(
                child: Container(
                    margin: EdgeInsets.all(10),
                    child: TextField(
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "Buy milk",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    )),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: FloatingActionButton(
                  onPressed: () {},
                  child: Icon(
                    Icons.add,
                    color: Colors.black,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
