import 'package:chatting_application/widget/widgets.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  @override
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
                  style: simpleWhiteTextFieldStyle(),
                  decoration: textFieldInputDecoration("Email")),
              SizedBox(height: 10),
              TextField(
                  style: simpleWhiteTextFieldStyle(),
                  decoration: textFieldInputDecoration("Password")),
              SizedBox(height: 10),
              
              SizedBox(
                height: 8,
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
                  "Sign in",
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
                      "Don't have account?",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        "Register Now",
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
