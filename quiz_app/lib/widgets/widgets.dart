import 'package:flutter/material.dart';

Widget appBar(BuildContext context) {
  return RichText(
    text: TextSpan(
        // text: 'Hello',
        style: TextStyle(fontSize: 22),
        children: [
          TextSpan(
            text: "Quiz",
            style:
                TextStyle(fontWeight: FontWeight.w200, color: Colors.black87),
          ),
          TextSpan(
              text: "Maker",
              style: TextStyle(
                  color: Colors.blue[600], fontWeight: FontWeight.bold))
        ]),
  );
}
