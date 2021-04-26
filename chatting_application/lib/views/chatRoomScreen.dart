import 'package:chatting_application/helper/aurhenticate.dart';
import 'package:chatting_application/helper/constants.dart';
import 'package:chatting_application/helper/helperfunctions.dart';
import 'package:chatting_application/services/auth.dart';
import 'package:chatting_application/views/search.dart';
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
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  getUserInfo() async {
    Constants.myName = await HelperFunctions.getUserNameSharedPreference();
    setState(() {});
  }

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
                // Navigator.pop(context);
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => Authenticate()));
              },
              icon: Icon(Icons.exit_to_app))
        ],
      ),
      body: Container(),
      floatingActionButton: FloatingActionButton(
        tooltip: "Search User",
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SearchScreen()));
        },
        child: Icon(Icons.search),
      ),
    );
  }
}
