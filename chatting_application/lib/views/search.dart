import 'package:chatting_application/models/user.dart';
import 'package:chatting_application/services/databse.dart';
import 'package:chatting_application/widget/widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  QuerySnapshot searchSnapShot;
  DatabaseMethod databaseMethod = new DatabaseMethod();
  TextEditingController searchTextEditController = new TextEditingController();

  // User user = User();
  //
  Widget searchList() {
    print(searchSnapShot.documents[0].data['name']);

    return searchSnapShot != null
        ? ListView.builder(
            shrinkWrap: true,
            itemCount: searchSnapShot.documents.length,
            itemBuilder: (context, index) {
              return SearchedTile(
                userName: searchSnapShot.documents[index].data['name'],
                email: searchSnapShot.documents[index].data['email'],
              );
            })
        : Container();
  }

  initiateSearch() async {
    await databaseMethod
        .getUserByUsername(searchTextEditController.text)
        .then((value) {
      setState(() {
        searchSnapShot = value;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    // initiateSearch();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // print(user.userId);
    // print("object");
    return Scaffold(
      appBar: appBarMain(context),
      body: Container(
        // height: 100,
        // width: 100,
        child: Column(
          children: [
            Container(
              color: Color(0x54FFFFFF),
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: searchTextEditController,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Search Username",
                          hintStyle: TextStyle(color: Colors.white54)),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      initiateSearch();
                      // databaseMethod
                      //     .getUserByUsername(searchTextEditController.text)
                      //     .then((value) {
                      //   print(value);
                      // });
                    },
                    child: Container(
                        height: 40,
                        width: 40,
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [
                              const Color(0x36FFFFFF),
                              const Color(0x0FFFFFFF),
                            ]),
                            borderRadius: BorderRadius.circular(40)),
                        child: Image.asset("assets/images/search_white.png")),
                  )
                ],
              ),
            ),
            searchSnapShot == null ? Container() : searchList()
          ],
        ),
      ),
    );
  }
}

class SearchedTile extends StatelessWidget {
  final String userName;
  final String email;
  SearchedTile({this.userName, this.email});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(userName, style: simpleWhiteTextFieldStyle()),
              Text(email, style: simpleWhiteTextFieldStyle()),
            ],
          ),
          Spacer(),
          Container(
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(30)),
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Text(
              "Message",
              style: simpleWhiteTextFieldStyle(),
            ),
          )
        ],
      ),
    );
  }
}
