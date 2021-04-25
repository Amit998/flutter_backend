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

  uploadUserInfo(userMap) async {
    print(userMap);
    await Firestore.instance.collection("users").add(userMap).catchError((e) {
      print(e.toString());
    });
  }
}
