import 'package:flutter/material.dart';

Widget myAppBar() {
  return AppBar(
    title: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text("this",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        Text("News",
            style: TextStyle(
                color: Colors.blue, fontWeight: FontWeight.bold))
      ],
    ),
    backgroundColor: Colors.transparent,
    elevation: 0.0,
  );
}
