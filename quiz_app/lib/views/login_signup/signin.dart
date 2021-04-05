import 'package:flutter/material.dart';
import 'package:quiz_app/helper/functions.dart';
import 'package:quiz_app/services/auth.dart';
import 'package:quiz_app/views/home/home.dart';
import 'package:quiz_app/views/login_signup/signup.dart';
import 'package:quiz_app/widgets/widgets.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  String email, password;

  AuthService authService = new AuthService();
  bool _isloading = false;

  signIn() async {
    setState(() {
      _isloading = true;
    });
    if (_formKey.currentState.validate()) {
      // print(email.toString());
      await authService.signInEmailAndPass(email, password).then((value) {
        if (value != null) {
          setState(() {
            _isloading = false;
          });

          HelperFunction.saveUserLogedIn(isLoggedIn: true);

          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => Home()));
        }
      });
      // setState(() {
      //   _isloading = false;
      // });
      //   Navigator.pushReplacement(
      //       context, MaterialPageRoute(builder: (context) => Home()));
    }
    setState(() {
      _isloading = false;
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
      body: _isloading
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
                        print(value);
                        email = value;
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
                        // print(value);
                        password = value;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                        onTap: () {
                          print("object");
                          signIn();
                        },
                        child: blueButton(context: context, label: "Sign In")),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account?",
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
                                    builder: (context) => SignUp()));
                          },
                          child: Text(
                            "Sign up",
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
