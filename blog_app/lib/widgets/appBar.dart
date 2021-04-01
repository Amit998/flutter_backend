import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final DateTime now = DateTime.now();

AppBar buildAppBar({bool notMainPage: false}) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0.0,
    // centerTitle: true,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Flutter",
          style: TextStyle(color: Colors.white, fontSize: 22),
        ),
        Text(
          "Blog",
          style: TextStyle(color: Colors.greenAccent),
        ),
      ],
    ),
    actions: [
      notMainPage
          ? IconButton(
              onPressed: () {
                print(now.toString());
              },
              icon: Icon(
                Icons.upload_file,
                color: Colors.greenAccent,
              ))
          : Text("")
    ],
  );
}
