import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignInBody extends StatefulWidget {
  @override
  _SignInBody createState() => _SignInBody();
}

class _SignInBody extends State<SignInBody> {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FlatButton(
            padding: EdgeInsets.all(10),
            color: Colors.black,
            onPressed: _signInButton,
            child: Text(
              "Sign In With Google",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  _signInButton() async {
    final GoogleSignInAccount googleUser = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
        idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);

    final FirebaseUser user =
        (await firebaseAuth.signInWithCredential(credential)).user;

    print(user.email);

    // print("object");
  }
}
