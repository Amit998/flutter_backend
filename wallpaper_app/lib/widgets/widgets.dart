import 'package:flutter/material.dart';

Widget BrandName() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        "Wallpaper",
        style: TextStyle(color: Colors.black),
      ),
      Text(
        "Hub",
        style: TextStyle(color: Colors.blue),
      )
    ],
  );
}
