import 'package:chatting_application/services/auth.dart';
import 'package:chatting_application/views/chatRoomScreen.dart';
import 'package:chatting_application/views/signup.dart';
import 'package:chatting_application/widget/widgets.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn(this.toggleView);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController emailEditingController = new TextEditingController();
  TextEditingController passwordEditingController = new TextEditingController();

  AuthMethods authMethods = new AuthMethods();
  bool isLoading = false;

  signMeIn() {
    setState(() {
      isLoading = true;
    });
    if (_formKey.currentState.validate()) {
      authMethods
          .signInWithEmailAndPssword(emailEditingController.text.toString(),
              passwordEditingController.text.toString())
          .then((value) {
        print(value);
        setState(() {
          isLoading = false;
        });
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => ChatRoom()));
      });
    } else {
      setState(() {
        isLoading = false;
      });
    }
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: appBarMain(context),
      body: isLoading
          ? Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : Container(
              height: size.height - 50,
              alignment: Alignment.bottomRight,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          // Spacer(),
                          TextFormField(
                              controller: emailEditingController,
                              validator: (val) {
                                return val.isEmpty
                                    ? "Please Insert Data"
                                    : val.length < 4
                                        ? "Length Is Small"
                                        : RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                                .hasMatch(val)
                                            ? null
                                            : "Incorrect Email Format";
                              },
                              style: simpleWhiteTextFieldStyle(),
                              decoration: textFieldInputDecoration("Email")),
                          SizedBox(height: 10),
                          TextFormField(
                              controller: passwordEditingController,
                              obscureText: true,
                              validator: (val) {
                                return val.isEmpty
                                    ? "Please Insert Data"
                                    : val.length < 4
                                        ? "Length Is Small"
                                        : null;
                              },
                              style: simpleWhiteTextFieldStyle(),
                              decoration: textFieldInputDecoration("Password")),
                          SizedBox(height: 10),

                          SizedBox(
                            height: 8,
                          ),
                          Container(
                            alignment: Alignment.centerRight,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                              child: Text(
                                "Forgot Password",
                                style: simpleWhiteTextFieldStyle(),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          InkWell(
                            onTap: () {
                              signMeIn();
                            },
                            child: Container(
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
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    widget.toggleView();
                                    // Navigator.pushReplacement(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (context) => SignUp()));
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(vertical: 10),
                                    child: Text(
                                      "Register Now",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          decoration: TextDecoration.underline),
                                    ),
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
                  ],
                ),
              ),
            ),
    );
  }
}
