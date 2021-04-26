import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethod {
  Future getUserByUsername(String username) async {
    return await Firestore.instance
        .collection("users")
        .where("name", isEqualTo: username)
        .getDocuments();
    //     .then((value) {
    //   print(value.documents.length);
    // });
  }

  Future getUserByEmail(String userEmail) async {
    return await Firestore.instance
        .collection("users")
        .where("email", isEqualTo: userEmail)
        .getDocuments();
    //     .then((value) {
    //   print(value.documents.length);
    // });
  }

  uploadUserInfo(userMap) async {
    print(userMap);
    await Firestore.instance.collection("users").add(userMap).catchError((e) {
      print(e.toString());
    });
  }

  createChatRoom(String chatRoomId, chatRoomMap) async {
    await Firestore.instance
        .collection("ChatRoom")
        .document(chatRoomId)
        .setData(chatRoomMap)
        .catchError((e) {
      print(e.toString());
    });
  }
}
