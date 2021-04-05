import 'package:flutter/material.dart';
import 'package:quiz_app/helper/functions.dart';
import 'package:quiz_app/services/auth.dart';
import 'package:quiz_app/views/home/home.dart';

import 'package:quiz_app/views/login_signup/signin.dart';
import 'package:quiz_app/widgets/widgets.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  String email, password, name, confirmPassword;
  AuthService authService = new AuthService();
  bool _isLoading = false;

  signUp() async {
    setState(() {
      _isLoading = true;
    });
    if (_formKey.currentState.validate()) {
      await authService
          .signUpWithEmailAndPassword(email, password)
          .then((value) {
        if (value != null) {
          setState(() {
            _isLoading = false;
          });
          HelperFunction.saveUserLogedIn(isLoggedIn: true);
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => Home()));
        }
      });
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: appBar(context),
        brightness: Brightness.light,
      ),
      body: _isLoading
          ? Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : Form(
              key: _formKey,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                margin: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Spacer(),
                    TextFormField(
                      validator: (val) {
                        return val.isEmpty ? "Enter Correct Email" : null;
                      },
                      decoration: InputDecoration(hintText: "Email"),
                      onChanged: (value) {
                        email = value;
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      validator: (val) {
                        return val.isEmpty ? "Enter Correct Name" : null;
                      },
                      decoration: InputDecoration(hintText: "Name"),
                      onChanged: (value) {
                        name = value;
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      obscureText: true,
                      validator: (val) {
                        return val.isEmpty ? "Enter Correct Password" : null;
                      },
                      decoration: InputDecoration(hintText: "Password"),
                      onChanged: (value) {
                        password = value;
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      obscureText: true,
                      validator: (val) {
                        return val.isEmpty
                            ? "Enter Correct Confirm Password"
                            : val != password
                                ? "Please Add Same Password"
                                : null;
                      },
                      decoration: InputDecoration(hintText: "Confirm Password"),
                      onChanged: (value) {
                        confirmPassword = value;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                        onTap: () {
                          signUp();
                        },
                        child: blueButton(context: context, label: "Sign Up")),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account?",
                          style: TextStyle(
                              color: Colors.black,
                              // fontWeight: FontWeight.bold,
                              fontSize: 14),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignIn()));
                          },
                          child: Text(
                            "Sign In",
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Colors.blue[900],
                                // fontWeight: FontWeight.bold,
                                fontSize: 14),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 80,
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
