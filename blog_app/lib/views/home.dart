import 'package:blog_app/views/create_blog.dart';
import 'package:blog_app/widgets/appBar.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(notMainPage: false),
      body: Container(),
      floatingActionButton: Container(
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton(
              backgroundColor: Colors.black12,
              child: Icon(
                Icons.add,
                size: 36,
                color: Colors.greenAccent,
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CreateBlog()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
