import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:social_media_login/pages/forgot_password.dart';
import 'package:social_media_login/pages/login.dart';
import 'package:social_media_login/pages/user_main.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();

  var email = '';
  var password = '';
  var confirmPassword = '';

  final emailController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final passwordController = TextEditingController();

  registration() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      print(userCredential);

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.blueGrey,
          content: Text(
            "Register Successfully, Please sign In",
            style: TextStyle(fontSize: 20),
          )));

      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (BuildContext context) => LoginPage()));
    } on FirebaseAuthException catch (error) {
      if (error.code == 'weak-password') {
        print("Password is too weak");

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.blueGrey,
          content: Text(
            "Password is too weak",
            style: TextStyle(fontSize: 18.0, color: Colors.amber),
          ),
        ));
      } else if (error.code == "email-already-in-use") {
        print("Account is already exists");
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.blueGrey,
          content: Text(
            "Account is already exists",
            style: TextStyle(fontSize: 18.0, color: Colors.amber),
          ),
        ));
      }
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
          child: Padding(
        padding: EdgeInsets.symmetric(vertical: 60, horizontal: 20),
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.all(30.0),
              child: Image.asset("assets/login.png"),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 16.0),
              child: TextFormField(
                autofocus: false,
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(fontSize: 20.0),
                  border: OutlineInputBorder(),
                  errorStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
                controller: emailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Enter Value';
                  } else if (!value.contains("@")) {
                    return 'Please Enter Valid Email';
                  }
                  return null;
                },
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10.0),
              child: TextFormField(
                autofocus: false,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(fontSize: 20.0),
                  border: OutlineInputBorder(),
                  errorStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
                controller: passwordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Enter Value';
                  }
                  return null;
                },
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10.0),
              child: TextFormField(
                autofocus: false,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
                  labelStyle: TextStyle(fontSize: 20.0),
                  border: OutlineInputBorder(),
                  errorStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
                controller: confirmPasswordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Enter Value';
                  } else if (value != passwordController.text) {
                    return 'Please Enter Same Password';
                  }
                  return null;
                },
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            email = emailController.text;
                            password = passwordController.text;
                          });

                          registration();
                        }
                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(fontSize: 18),
                      )),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    ForgotPassword()));
                      },
                      child: Text(
                        "Forgot Password ?",
                        style: TextStyle(fontSize: 12.0),
                      ))
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already Have Account?"),
                  TextButton(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            PageRouteBuilder(
                                pageBuilder: (context, a, b) => SignUp(),
                                transitionDuration: Duration(seconds: 0)),
                            (route) => false);
                      },
                      child: Text(
                        "LogIn",
                        style: TextStyle(),
                      ))
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
