import 'package:chatting_application/widget/widgets.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController userNameEditingController = new TextEditingController();
  TextEditingController emailEditingController = new TextEditingController();
  TextEditingController passwordEditingController = new TextEditingController();
  

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: appBarMain(context),
      body: Container(
        // alignment: Alignment.bottomRight,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Spacer(),
              TextField(
                  controller: emailEditingController,
                  style: simpleWhiteTextFieldStyle(),
                  decoration: textFieldInputDecoration("Email")),
              SizedBox(height: 10),
              TextField(
                  controller: userNameEditingController,
                  style: simpleWhiteTextFieldStyle(),
                  decoration: textFieldInputDecoration("Username")),
              SizedBox(height: 10),
              TextField(
                  controller: passwordEditingController,
                  style: simpleWhiteTextFieldStyle(),
                  decoration: textFieldInputDecoration("Password")),
              SizedBox(
                height: 10,
              ),
              Container(
                alignment: Alignment.centerRight,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Text(
                    "Forgot Password",
                    style: simpleWhiteTextFieldStyle(),
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                alignment: Alignment.center,
                width: size.width * 0.85,
                // height: size.width * 0.1,
                padding: EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      const Color(0xff007EF4),
                      const Color(0xff2A75BC),
                    ]),
                    // color: Colors.blue,
                    borderRadius: BorderRadius.circular(30)),
                child: Text(
                  "Sign Up",
                  style: simpleWhiteTextFieldStyle(),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                alignment: Alignment.center,
                width: size.width * 0.85,
                // height: size.width * 0.1,
                padding: EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                    color: Colors.white,
                    // color: Colors.blue,
                    borderRadius: BorderRadius.circular(30)),
                child: Text(
                  "Sign in With Google",
                  style: simpleBlackTextFieldStyle(),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already Have Account?",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        "Login Here!",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            decoration: TextDecoration.underline),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              // Spacer()
            ],
          ),
        ),
      ),
    );
  }
}
