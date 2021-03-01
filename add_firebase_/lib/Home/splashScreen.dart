import 'package:add_firebase_/Home/login_screen.dart';
import 'package:add_firebase_/variables.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "assets/logo2.png",
            height: 150,
          ),
          SizedBox(height: 20),
          Text(
            "Welcome To SplashScreen",
            style: TextStyle(fontSize: 30, color: Colors.white),
          ),
          SizedBox(height: 20),
          Container(
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              "A one-stop portal for you to learn the latest technologies from scratch",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
              maxLines: 2,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30),
            padding: EdgeInsets.all(20),
            child: RaisedButton(
              // padding: EdgeInsets.symmetric(horizontal: 30),
              color: logoGreen,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Get Started",
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                  SizedBox(width: 10),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                    size: 25,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
