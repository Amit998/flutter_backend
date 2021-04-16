import 'package:flutter/material.dart';

Widget BrandName() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        "My",
        style: TextStyle(color: Colors.black),
      ),
      Text(
        "App",
        style: TextStyle(color: Colors.blueAccent),
      )
    ],
  );
}
