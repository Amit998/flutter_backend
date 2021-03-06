import 'package:brew_crew_app/screens/authenticate/register.dart';
import 'package:brew_crew_app/screens/authenticate/sign_in.dart';
import 'package:flutter/material.dart';

class Authentication extends StatefulWidget {
  @override
  _AuthenticationState createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  bool showSignIn = true;
  void toggleView() {
    setState(() {
      showSignIn = !showSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return SignIn( toggleView:toggleView );
    } else {
      return Register( toggleView:toggleView );
    }
  }
}
