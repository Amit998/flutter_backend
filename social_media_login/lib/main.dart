import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:social_media_login/pages/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<FirebaseApp>? _initialization;

  @override
  void initState() {
    _initialization = Firebase.initializeApp();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // print("object");
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            print(snapshot.error);
            return Container(
                // child: Text("Hello"),
                );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            print("waiting");
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          print("no issue");
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: "Flutter Email And Password",
              theme: ThemeData(
                primaryColor: Colors.blue,
              ),
              home: LoginPage());
        });
  }
}
