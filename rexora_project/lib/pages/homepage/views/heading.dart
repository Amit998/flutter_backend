import 'package:flutter/material.dart';

class Heading extends StatelessWidget {
  const Heading({Key key, @required this.name}) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          padding: EdgeInsets.all(10),
          child: Text(
            name.toString(),
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          )),
    );
  }
}
