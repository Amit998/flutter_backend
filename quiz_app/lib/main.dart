import 'package:flutter/material.dart';
import 'package:quiz_app/views/login_signup/signin.dart';
// import 'package:quiz_app/views/login_signup/signin.dart';
import 'package:quiz_app/views/login_signup/signup.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Quiz App",
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      debugShowCheckedModeBanner: false,
      home: SignIn(),
    );
  }
}
