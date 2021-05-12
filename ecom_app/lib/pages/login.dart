// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:ecom_app/main.dart';
// import 'package:ecom_app/pages/home_page.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class Login extends StatefulWidget {
//   @override
//   _LoginState createState() => _LoginState();
// }

// class _LoginState extends State<Login> {
//   final GoogleSignIn googleSignIn = new GoogleSignIn();
//   final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
//   SharedPreferences? preferences;
//   bool loading = false;
//   bool isLoggedIn = false;

//   @override
//   void initState() {
//     super.initState();
//     isSignedIn();
//   }

//   void isSignedIn() async {
//     setState(() {
//       loading = true;
//     });

//     Future handleSignIn() async {
//       preferences = await SharedPreferences.getInstance();

//       setState(() {
//         loading = true;
//       });

//       GoogleSignInAccount googleUser = await googleSignIn.signIn();
//       GoogleSignInAuthentication googleSignInAuthentication =
//           await googleUser.authentication;

//       FirebaseUser firebaseUser = await firebaseAuth.signInWithGoogle(
//           idToken: googleSignInAuthentication.idToken,
//           accessToken: googleSignInAuthentication.accessToken);

//       if (firebaseUser != null) {
//         final QuerySnapshot result = await Firestore.instance
//             .collection("users")
//             .where("id", isEqualTo: firebaseUser.uid)
//             .getDocuments();
//         final List<DocumentSnapshot> documents = result.documents;

//         if (documents.length == 0) {
//           // Inser the user to our collection
//           Firestore.instance
//               .collection("users")
//               .document(firebaseUser.uid)
//               .setData({
//             "id": firebaseUser.uid,
//             "username": firebaseUser.displayName,
//             "profilePicture": firebaseUser.photoUrl,
//             "phoneNo": firebaseUser.phoneNumber,
//           });
//           await preferences?.setString("id", firebaseUser.uid);
//           await preferences?.setString("username", firebaseUser.displayName);
//           await preferences?.setString("photoUrl", firebaseUser.photoUrl);
//           await preferences?.setString("phoneNo", firebaseUser.phoneNumber);
//         } else {
//           await preferences?.setString("id", documents[0]['id']);
//           await preferences?.setString("username", documents[0]['username']);
//           await preferences?.setString("photoUrl", documents[0]['photoUrl']);
//           await preferences?.setString("phoneNo", documents[0]['phoneNo']);
//         }
//         Fluttertoast.showToast(msg: "Login Was Succesful");
//         setState(() {
//           loading = false;
//         });
        
//       } else {}
//     }

//     preferences = await SharedPreferences.getInstance();
//     isLoggedIn = await googleSignIn.isSignedIn();
//     if (isLoggedIn) {
//       Navigator.pushReplacement(
//           context, MaterialPageRoute(builder: (context) => HomePage()));
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Center(
//         child: InkWell(
//           onTap: () {
//             // handleSignIn();
//           },
//           child: Text("Click"),
//         ),
//       ),
//     );
//   }
// }
