import 'package:flutter/material.dart';

class AdressLocation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 70, top: 20),
        child: Row(
          children: [
            Column(
              children: [
                Icon(
                  Icons.map,
                  size: 120,
                  color: Colors.grey,
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "DELIVERY",
                  textAlign: TextAlign.left,
                  style: TextStyle(color: Colors.grey),
                ),
                Text(
                  "45, Amarlands",
                  textAlign: TextAlign.left,
                  style: TextStyle(color: Colors.grey),
                ),
                Text(
                  "Nr. Hamer Road, London",
                  textAlign: TextAlign.left,
                  style: TextStyle(color: Colors.grey),
                )
              ],
            )
          ],
        ));
  }
}
