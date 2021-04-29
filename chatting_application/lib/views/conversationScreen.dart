import 'package:chatting_application/helper/constants.dart';
import 'package:chatting_application/services/databse.dart';
import 'package:chatting_application/widget/widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ConversationScreen extends StatefulWidget {
  String chatRoomId;
  ConversationScreen({this.chatRoomId});
  @override
  _ConversationScreenState createState() => _ConversationScreenState();
}

class _ConversationScreenState extends State<ConversationScreen> {
  DatabaseMethod databaseMethod = new DatabaseMethod();
  TextEditingController messageController = new TextEditingController();

  Stream chatMessageStream;

  Widget ChatMessageList() {
    return StreamBuilder(
      stream: chatMessageStream,
      builder: (context, snapshot) {
        return snapshot.hasData
            ? ListView.builder(
                itemCount: snapshot.data.documents.length,
                itemBuilder: (context, index) {
                  return MessageTile(
                    message: snapshot.data.documents[index].data['message'],
                    isSendByMe: snapshot.data.documents[index].data['sendBy'] ==
                        Constants.myName,
                  );
                })
            : Container();
      },
    );
  }

  sendMessge() {
    if (messageController.text.isNotEmpty) {
      Map<String, dynamic> messageMap = {
        "message": messageController.text,
        "sendBy": Constants.myName,
        "time": DateTime.now().microsecondsSinceEpoch
      };
      // print(messageMap);

      databaseMethod
          .sendConversationMessages(widget.chatRoomId, messageMap)
          .then((value) {
        messageController.text = "";
        // print(value);
      });
    }
  }

  @override
  void initState() {
    databaseMethod.getChats(widget.chatRoomId).then((value) {
      setState(() {
        chatMessageStream = value;
      });
    });

    // setState(() {
    // chatMessageStream = databaseMethod.getChats(widget.chatRoomId);
    // print(chatMessageStream);
    //
    // });
    // .then((value) {
    // print(value);
    // setState(() {
    //   chatMessageStream = value;
    //   print(chatMessageStream.length);
    // });
    // });
    // print(snapshotChats.length);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMain(context),
      body: Container(
        child: Stack(
          children: [
            ChatMessageList(),
            SizedBox(
              height: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.bottomCenter,
              // color: Color(0x54FFFFFF),
              // padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              // color: Color(0x54FFFFFF),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                decoration: BoxDecoration(
                    color: Color(0x54FFFFFF),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: messageController,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            hintText: "Send Message...",
                            // fillColor: Colors.white,
                            hintStyle: TextStyle(color: Colors.white),
                            border: InputBorder.none),
                      ),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    GestureDetector(
                      onTap: () {
                        sendMessge();
                      },
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                            const Color(0x26FFFFFF),
                            const Color(0x0FFFFFFF),
                          ]),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                            // bottomLeft: Radius.circular(20),
                            // bottomRight: Radius.circular(20),
                          ),
                        ),
                        padding: EdgeInsets.all(12),
                        child: Image.asset("assets/images/send.png"),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MessageTile extends StatelessWidget {
  final String message;
  final bool isSendByMe;

  MessageTile({@required this.message, @required this.isSendByMe});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 2, horizontal: 2),
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(
          left: isSendByMe ? 0 : 10, right: isSendByMe ? 10 : 0),
      alignment: isSendByMe ? Alignment.topRight : Alignment.topLeft,
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
              bottomLeft: isSendByMe ? Radius.circular(20) : Radius.circular(0),
              bottomRight:
                  isSendByMe ? Radius.circular(0) : Radius.circular(20),
            ),
            gradient: LinearGradient(colors: [
              isSendByMe ? const Color(0xff145C9E) : Color(0x26FFFFFF),
              isSendByMe ? const Color(0xff1F1F1F) : Color(0x26FFFFFF)
            ])),
        child: Text(
          message,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
