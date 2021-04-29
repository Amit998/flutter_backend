import 'package:chatting_application/helper/aurhenticate.dart';
import 'package:chatting_application/helper/constants.dart';
import 'package:chatting_application/helper/helperfunctions.dart';
import 'package:chatting_application/services/auth.dart';
import 'package:chatting_application/services/databse.dart';
import 'package:chatting_application/views/conversationScreen.dart';
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
  DatabaseMethod databaseMethod = new DatabaseMethod();
  Stream chatRoomStream;

  Widget chatroomList() {
    return StreamBuilder(
        stream: chatRoomStream,
        builder: (context, snapshot) {
          print(snapshot.hasData);
          return snapshot.hasData
              ? ListView.builder(
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (context, index) {
                    return ChatRoomTile(
                      chatroomId:
                          snapshot.data.documents[index].data["chatroomId"],
                      name: snapshot.data.documents[index].data["chatroomId"]
                          .toString()
                          .replaceAll("_", "")
                          .replaceAll(Constants.myName, ""),
                    );
                  })
              : Container();
        });
  }

  @override
  void initState() {
    // TODO: implement initState
    getUserInfogetChats();

    super.initState();
  }

  getUserInfogetChats() async {
    Constants.myName = await HelperFunctions.getUserNameSharedPreference();
    setState(() {});
    // print("${Constants.myName} this is my name");
    databaseMethod.getChatRooms(Constants.myName).then((value) {
      setState(() {
        chatRoomStream = value;
        print(chatRoomStream);
      });
    });
    // print(Constants.myName);
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
                HelperFunctions.saveduserLoggedSharedPreference(
                    true); // check this line
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => Authenticate()));
              },
              icon: Icon(Icons.exit_to_app))
        ],
      ),
      body: chatroomList(),
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

class ChatRoomTile extends StatelessWidget {
  final String name;
  final String chatroomId;

  ChatRoomTile({@required this.name, @required this.chatroomId});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ConversationScreen(
                      chatRoomId: chatroomId,
                    )));
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        // margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              alignment: Alignment.center,
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(30)),
              child: Text(
                "${name.substring(0, 1).toUpperCase()}",
                style: simpleWhiteTextFieldStyle(),
              ),
            ),
            SizedBox(width: 10),
            Text(
              name,
              style: simpleWhiteTextFieldStyle(),
            )
          ],
        ),
      ),
    );
  }
}
