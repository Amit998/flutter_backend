import 'package:flutter/material.dart';

Widget appBarMain(BuildContext context) {
  return AppBar(
    title: Image.asset(
      "assets/images/logo.png",
      height: 50,
    ),
    
  );
}

InputDecoration textFieldInputDecoration(String hintText) {
  return InputDecoration(
      hintText: hintText.toString(),
      hintStyle: TextStyle(color: Colors.white),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
        // borderRadius: BorderRadius.circular(25.0),
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
        // borderRadius: BorderRadius.circular(25.0),
      ));
}

TextStyle simpleBlackTextFieldStyle() {
  return TextStyle(
      color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500);
}

TextStyle simpleWhiteTextFieldStyle() {
  return TextStyle(
      color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500);
}
