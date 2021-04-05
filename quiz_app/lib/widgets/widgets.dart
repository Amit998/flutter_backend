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

Widget blueButton({BuildContext context, String label,double buttonWidth}) {
  return Container(
    alignment: Alignment.center,
    height: 50,
    width: buttonWidth != null? buttonWidth : MediaQuery.of(context).size.width * 0.90,
    decoration: BoxDecoration(
        color: Colors.blue, borderRadius: BorderRadius.circular(30)
        // shape:
        ),
    child: Text(
      "$label",
      style: TextStyle(color: Colors.white, fontSize: 18),
    ),
  );
}
