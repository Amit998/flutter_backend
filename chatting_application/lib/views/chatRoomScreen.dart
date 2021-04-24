import 'package:chatting_application/services/auth.dart';
import 'package:chatting_application/views/signin.dart';
import 'package:chatting_application/widget/widgets.dart';
import 'package:flutter/material.dart';

class ChatRoom extends StatefulWidget {
  @override
  _ChatRoomState createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  AuthMethods authMethods = new AuthMethods();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          "assets/images/logo.png",
          height: 50,
        ),
        actions: [
          IconButton(
              padding: EdgeInsets.all(10),
              onPressed: () {
                authMethods.signOut();
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => SignIn()));
              },
              icon: Icon(Icons.exit_to_app))
        ],
      ),
      body: Container(),
    );
  }
}
