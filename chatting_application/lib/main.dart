import 'package:chatting_application/helper/aurhenticate.dart';
import 'package:chatting_application/helper/helperfunctions.dart';
import 'package:chatting_application/views/chatRoomScreen.dart';
import 'package:chatting_application/views/signin.dart';
import 'package:chatting_application/views/signup.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  //

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool userIsLoggedIn = false;

  getLoggedInStatus() async {
    await HelperFunctions.getUserLoggedInSharedPreference().then((value) {
      setState(() {
        userIsLoggedIn = value;
      });
    });
  }

  @override
  void initState() {
    getLoggedInStatus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
            primaryColor: Color(0xff145C9E),
            scaffoldBackgroundColor: Color(0xff1F1F1F),
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity),
        home: userIsLoggedIn ? ChatRoom() : Authenticate());
  }
}

class IAMBlank extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
