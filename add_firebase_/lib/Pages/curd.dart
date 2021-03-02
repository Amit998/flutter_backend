import 'package:add_firebase_/variables.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CURD extends StatefulWidget {
  @override
  _CURDState createState() => _CURDState();
}

class _CURDState extends State<CURD> {
  Map data;
  bool dataSend = false;

  _fetchData() {
    CollectionReference collectionReference =
        Firestore.instance.collection('data');

    collectionReference.snapshots().listen((snapshot) {
      // print(event);
      setState(() {
        data = snapshot.documents[1].data;
        dataSend = true;
        print(data);
      });
    });

    // collectionReference.snapshots().listen((snapshot) {
    //   setState(() {
    //     data = snapshot.documents[0].data;
    //     // dataSend = true;
    //   });
    // });
  }

  _updateData() async {
    CollectionReference collectionReference =
        Firestore.instance.collection('data');

    QuerySnapshot querySnapshot = await collectionReference.getDocuments();
    querySnapshot.documents[0].reference
        .updateData({"name": "Tom", "moto": "We Have Done it"});
  }

  _dataDelete() async {
    CollectionReference collectionReference =
        Firestore.instance.collection('data');

    QuerySnapshot querySnapshot = await collectionReference.getDocuments();
    querySnapshot.documents[0].reference.delete();
  }

  _addData() {
    Map<String, dynamic> demoData = {
      "name": "Amit",
      "moto": "learn till the End"
    };

    CollectionReference collectionReference =
        Firestore.instance.collection('data');

    collectionReference.add(demoData).then((value) {
      print(data);
      setState(() {
        data = demoData;
        dataSend = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: primaryColor,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {},
          )),
      body: Container(
        color: Colors.blue,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 20),
                padding: EdgeInsets.all(40),
                child: Text(
                  "CURD OPRATION ON CLOUD FIRESTORE",
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
              ),
              SizedBox(height: 10),
              Container(
                width: 300,
                child: FlatButton(
                  color: Colors.orange,
                  onPressed: _fetchData,
                  child: Text(
                    "Fetch Data",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                width: 300,
                child: FlatButton(
                  color: Colors.pink,
                  onPressed: _addData,
                  child: Text(
                    "Add Data",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                width: 300,
                child: FlatButton(
                  color: Colors.green,
                  onPressed: _updateData,
                  child: Text(
                    "Update Data",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                width: 300,
                child: FlatButton(
                  color: Colors.red[400],
                  onPressed: _dataDelete,
                  child: Text(
                    "Delete Data",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                alignment: Alignment.center,
                width: 300,
                child: Text(
                  // data == null ? "NULL" : data,
                  data["moto"].toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
