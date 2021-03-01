import 'package:add_firebase_/Home/sign_In.dart';
import 'package:add_firebase_/Home/splashScreen.dart';
import 'package:add_firebase_/Pages/CMS.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String title;

  const HomePage({Key key, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      // backgroundColor: Colors.black,
      // ),
      // body: SignInBody(),
      // body: SplashScreen(),
      body: CMS(),
    );
  }
}
