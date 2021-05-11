import 'package:ecom_app/main.dart';
import 'package:ecom_app/pages/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GoogleSignIn googleSignIn = new GoogleSignIn();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  SharedPreferences? preferences;
  bool loading = false;
  bool isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    isSignedIn();
  }

  void isSignedIn() async {
    setState(() {
      loading = true;
    });

    Future handleSignIn() async {
      preferences = await SharedPreferences.getInstance();

      setState(() {
        loading = true;
      });

      GoogleSignInAccount googleUser = await googleSignIn.signIn();
      GoogleSignInAuthentication googleSignInAuthentication =
          await googleUser.authentication;
      
      FirebaseUser firebaseUser=await firebaseAuth.signInWithCredential(credential)
    }

    preferences = await SharedPreferences.getInstance();
    isLoggedIn = await googleSignIn.isSignedIn();
    if (isLoggedIn) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
