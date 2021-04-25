import 'package:chatting_application/services/auth.dart';
import 'package:chatting_application/services/databse.dart';
import 'package:chatting_application/views/chatRoomScreen.dart';
import 'package:chatting_application/views/signin.dart';
import 'package:chatting_application/widget/widgets.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  final Function toggle;
  SignUp(this.toggle);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController userNameEditingController = new TextEditingController();
  TextEditingController emailEditingController = new TextEditingController();
  TextEditingController passwordEditingController = new TextEditingController();
  TextEditingController confimPasswordEditingController =
      new TextEditingController();

  bool isLoading = false;

  final _formkey = GlobalKey<FormState>();
  DatabaseMethod databaseMethod = new DatabaseMethod();
  AuthMethods authMethods = new AuthMethods();

  signMeUP() {
    setState(() {
      isLoading = true;
    });

    if (_formkey.currentState.validate()) {
      authMethods
          .signUpWithEmailAndPassword(emailEditingController.text.toString(),
              passwordEditingController.text.toString())
          .then((value) {
        Map<String, dynamic> userMap = {
          "user":userNameEditingController.text.toString(),
          "email":emailEditingController.text.toString(),

        };
        databaseMethod.uploadUserInfo(userMap);
        // print(value);
        print("$value");
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
          : SingleChildScrollView(
              // alignment: Alignment.bottomRight,
              child: Container(
                height: size.height - 50,
                padding: EdgeInsets.symmetric(horizontal: 24),
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Form(
                      key: _formkey,
                      child: Column(
                        children: [
                          // Spacer(),
                          // SizedBox(
                          // height: size.height * .35,
                          // ),
                          TextFormField(
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
                              controller: emailEditingController,
                              style: simpleWhiteTextFieldStyle(),
                              decoration: textFieldInputDecoration("Email")),
                          SizedBox(height: 15),
                          TextFormField(
                              validator: (val) {
                                return val.isEmpty
                                    ? "Please Insert Data"
                                    : val.length < 4
                                        ? "Length Is Small"
                                        : null;
                              },
                              controller: userNameEditingController,
                              style: simpleWhiteTextFieldStyle(),
                              decoration: textFieldInputDecoration("Username")),
                          SizedBox(height: 15),
                          TextFormField(
                              obscureText: true,
                              validator: (val) {
                                return val.isEmpty
                                    ? "Please Insert Data"
                                    : val.length < 4
                                        ? "Length Is Small"
                                        : null;
                              },
                              controller: passwordEditingController,
                              style: simpleWhiteTextFieldStyle(),
                              decoration: textFieldInputDecoration("Password")),
                          SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                              obscureText: true,
                              validator: (val) {
                                print(val);
                                print(passwordEditingController.text);
                                return val.isEmpty
                                    ? "Please Insert Data"
                                    : val.length < 4
                                        ? "Length Is Small"
                                        : val !=
                                                passwordEditingController.text
                                                    .toString()
                                            ? "Password Dosn't Matched"
                                            : null;
                              },
                              controller: confimPasswordEditingController,
                              style: simpleWhiteTextFieldStyle(),
                              decoration:
                                  textFieldInputDecoration("Confim Password")),
                          SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
                        signMeUP();
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
                          "Sign Up",
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
                            "Already Have Account?",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              widget.toggle();
                              // Navigator.pushReplacement(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => SignIn()));
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Text(
                                "SignIn Here!",
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
            ),
    );
  }
}
