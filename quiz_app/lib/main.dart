import 'package:flutter/material.dart';
import 'package:quiz_app/helper/functions.dart';
import 'package:quiz_app/views/home/home.dart';
import 'package:quiz_app/views/login_signup/signin.dart';
// import 'package:quiz_app/views/login_signup/signin.dart';
import 'package:quiz_app/views/login_signup/signup.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isLoggedin = false;

  checkedUserLoggedInStatus() async {
    HelperFunction.getUserLoggedInDetails().then((value) {
      setState(() {
        _isLoggedin = value;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    checkedUserLoggedInStatus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Quiz App",
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      debugShowCheckedModeBanner: false,
      home: (_isLoggedin ?? false) ? Home() : SignIn(),
    );
  }
}
